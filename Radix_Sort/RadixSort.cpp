/******************************************************************************
* FILE: RadixSort.cpp
* DESCRIPTION:  
*   This file contains a C++ implementation of the Radix Sort algorithm
*   using MPI.  The algorithm sorts a list of integers in the range
*   0 to MAXKEY.
* LAST REVISED: 10/16/2025
******************************************************************************/
#include "mpi.h"
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <float.h>
#include <vector>
#include <algorithm>
#include <cmath>
#include <iostream>
#include <ctime>
using namespace std;

#include <caliper/cali.h>
#include <caliper/cali-manager.h>
#include <adiak.hpp>

#define MAXKEY 65536

// integer power since pow is a double (can mess up operations)
inline int integer_power(int base, int exp){
    int result = 1;
    for (int i = 0; i < exp; ++i){
        result *= base;
    }
    return result;
}

vector<int> histogram(vector<int> local_arr, int digit, int base){
    int n = static_cast<int>(local_arr.size());
    vector<int> hist(base, 0);
    int curr_place = static_cast<int>(integer_power(base, digit));
    for(int i = 0; i < n; ++i){
        int d = (local_arr[i] / curr_place) % base;
        hist[d]++;
    }
    return hist;
}

vector<int> prefix_sum(vector<int> hist){
    int n = static_cast<int>(hist.size());
    vector<int> offsets(n, 0);
    for(int i = 1; i < n; ++i){
        offsets[i] = offsets[i - 1] + hist[i - 1];
    }
    return offsets;
}

struct BlockPart {
    int size;   // number of elements this rank own
    int start;  // the starting global index of the ranks portion
};

// divides total number of eleemnts into equal chunks
inline vector<BlockPart> make_block_partition(int global_n, int size){
    vector<BlockPart> parts(size);
    int q = global_n / size; 
    int r = global_n % size;
    int start = 0;
    for (int p = 0; p < size; ++p) {
        int len = q + (p < r ? 1 : 0);
        parts[p] = { len, start };
        start += len;
    }
    return parts;
}

// given a global index, find which rank owns and its positoin in the subarray
inline void owner_of_index(int global_idx, const vector<BlockPart>& parts,
                           int& owner_rank, int& pos_in_local) {
    int p = 0;
    while (p+1 < (int)parts.size() && parts[p+1].start <= global_idx) ++p;
    owner_rank = p;
    pos_in_local = global_idx - parts[p].start;
}

struct DestPos{
    int dest; 
    int pos; 
    };

vector<DestPos> compute_destination(vector<int>& local_arr, int digit, int base, vector<int> local_offsets, 
                                    vector<int>& global_offsets, const vector<int>& prior, const std::vector<BlockPart>& parts){
    int n = static_cast<int>(local_arr.size());
    std::vector<DestPos> out(n);
    int curr_place = integer_power(base, digit);    

    for(int i = 0; i < n; ++i){
        int d = (local_arr[i] / curr_place) % base;
        int global_index = global_offsets[d] + prior[d] + local_offsets[d];

        int owner, pos_in_owner;
        owner_of_index(global_index, parts, owner, pos_in_owner);
        out[i] = {owner, pos_in_owner};
        local_offsets[d]++;
    }
    return out;
}


vector<int> radix_sort(vector<int> local_arr, int base, MPI_Comm comm){
    CALI_CXX_MARK_FUNCTION;
    int rank, size;
    MPI_Comm_rank(comm, &rank);
    MPI_Comm_size(comm, &size);
    int n = static_cast<int>(local_arr.size());

    int local_max = (n > 0) ? *max_element(local_arr.begin(), local_arr.end()): 0;
    int global_max = 0;
    
    CALI_MARK_BEGIN("comm");
    CALI_MARK_BEGIN("comm_small");
    CALI_MARK_BEGIN("MPI_Allreduce");
    MPI_Allreduce(&local_max, &global_max, 1, MPI_INT, MPI_MAX, comm);
    CALI_MARK_END("MPI_Allreduce");
    CALI_MARK_END("comm_small");
    CALI_MARK_END("comm");
    

    int global_n = 0;
    int local_n = n;
    CALI_MARK_BEGIN("comm");
    CALI_MARK_BEGIN("comm_small");
    CALI_MARK_BEGIN("MPI_Allreduce");
    MPI_Allreduce(&local_n, &global_n, 1, MPI_INT, MPI_SUM, comm);
    CALI_MARK_END("MPI_Allreduce");
    CALI_MARK_END("comm_small");
    CALI_MARK_END("comm");

    int digits = 0;
    while (global_max > 0){
        digits++;
        global_max /= base;
    }

    auto parts = make_block_partition(global_n, size);

    for(int i = 0; i < digits; ++i){
        // create local histogram
        CALI_MARK_BEGIN("comp");
        CALI_MARK_BEGIN("comp_large");
        vector<int> local_hist = histogram(local_arr, i, base);
        CALI_MARK_END("comp_large");
        CALI_MARK_END("comp");

        // combine local histograms into global histogram
        vector<int> global_hist(base, 0);
        CALI_MARK_BEGIN("comm");
        CALI_MARK_BEGIN("comm_small");
        MPI_Allreduce(local_hist.data(), global_hist.data(), base, MPI_INT, MPI_SUM, comm);
        CALI_MARK_END("comm_small");
        CALI_MARK_END("comm");

        //compute prefix sum of global histogram to get global offsets
        CALI_MARK_BEGIN("comp");
        CALI_MARK_BEGIN("comp_small");
        vector<int> global_offsets = prefix_sum(global_hist);
        CALI_MARK_END("comp_small");
        CALI_MARK_END("comp");

        CALI_MARK_BEGIN("comp");
        CALI_MARK_BEGIN("comp_small");
        vector<int> prior(base, 0);
        for (int j = 0; j < base; ++j){
            int in = local_hist[j];
            int out = 0;
            CALI_MARK_BEGIN("comm");
            CALI_MARK_BEGIN("comm_small");
            CALI_MARK_BEGIN("MPI_Exscan");
            MPI_Exscan(&in, &out, 1, MPI_INT, MPI_SUM, comm);
            CALI_MARK_END("MPI_Exscan");
            CALI_MARK_END("comm_small");
            CALI_MARK_END("comm");
            if (rank == 0){
                out = 0;
            }
            prior[j] = out;
        }
        CALI_MARK_END("comp_small");;
        CALI_MARK_END("comp");

        //compute prefix sum of local histogram to get local offsets
        vector<int> local_offsets(base, 0);

        //compute desinations and  for each element in local array
        CALI_MARK_BEGIN("comp");
        CALI_MARK_BEGIN("comp_large");
        vector<DestPos> destinations = compute_destination(local_arr, i, base, local_offsets, global_offsets, prior, parts);
        CALI_MARK_END("comp_large");
        CALI_MARK_END("comp");

        CALI_MARK_BEGIN("comp");
        CALI_MARK_BEGIN("comp_small");
        //compute send counts
        vector<int> send_counts(size, 0);
        for (int j = 0; j < n; ++j) {
            int dest = destinations[j].dest;
            send_counts[dest]++;
        }
        CALI_MARK_END("comp_small");
        CALI_MARK_END("comp");

        vector<int> recv_counts(size, 0);
        CALI_MARK_BEGIN("comm");
        CALI_MARK_BEGIN("comm_large");
        CALI_MARK_BEGIN("MPI_Alltoall");
        MPI_Alltoall(send_counts.data(), 1, MPI_INT, recv_counts.data(), 1, MPI_INT, comm);
        CALI_MARK_END("MPI_Alltoall");
        CALI_MARK_END("comm_large");
        CALI_MARK_END("comm");

        CALI_MARK_BEGIN("comp");
        CALI_MARK_BEGIN("comp_small");
        // compute displacements for sending and receiving
        vector<int> send_displs(size, 0);
        vector<int> recv_displs(size, 0);
        for(int j = 1; j < size; ++j){
            send_displs[j] = send_displs[j-1] + send_counts[j-1];
            recv_displs[j] = recv_displs[j-1] + recv_counts[j-1];
        }

        int total_send = send_displs[size-1] + send_counts[size-1];
        int total_recv = recv_displs[size-1] + recv_counts[size-1];
        

        vector<int> send_vals(total_send);
        vector<int> send_pos(total_send);
        vector<int> write_index = send_displs;
        for(int j = 0; j < n; ++j){
            int dest = destinations[j].dest;
            int w = write_index[dest]++;
            send_vals[w] = local_arr[j];
            send_pos[w] = destinations[j].pos;
        }
        CALI_MARK_END("comp_small");
        CALI_MARK_END("comp");
        // all to all echange of element values and positions
        vector<int> recv_vals(total_recv);
        vector<int> recv_pos(total_recv);
        CALI_MARK_BEGIN("comm");
        CALI_MARK_BEGIN("comm_large");
        CALI_MARK_BEGIN("MPI_Alltoallv");
        MPI_Alltoallv(send_pos.data(),  send_counts.data(), send_displs.data(), MPI_INT,
              recv_pos.data(),  recv_counts.data(), recv_displs.data(), MPI_INT, comm);

        MPI_Alltoallv(send_vals.data(), send_counts.data(), send_displs.data(), MPI_INT,
              recv_vals.data(), recv_counts.data(), recv_displs.data(), MPI_INT, comm);
        CALI_MARK_END("MPI_Alltoallv");
        CALI_MARK_END("comm_large");
        CALI_MARK_END("comm");
        
        std::vector<int> new_local_arr(parts[rank].size);
        for (int k = 0; k < total_recv; ++k) {
            new_local_arr[recv_pos[k]] = recv_vals[k];
        }
        local_arr.swap(new_local_arr);
        }
        return local_arr;
    }


int main(int argc, char* argv[]){
    CALI_CXX_MARK_FUNCTION; 
    
    // Create caliper ConfigManager object
    cali::ConfigManager mgr;
    mgr.start();

    int rank, size;
    
    CALI_MARK_BEGIN("MPI_Init");
    MPI_Init(&argc, &argv);
    CALI_MARK_END("MPI_Init");
    MPI_Comm_rank(MPI_COMM_WORLD, &rank); //processor id
    MPI_Comm_size(MPI_COMM_WORLD, &size); //number of processes

    // Check command line arguments
    if (argc != 4) {
        if (rank == 0)
            printf("Usage: %s <n> <digit> <base>\n", argv[0]);
        MPI_Finalize();  
        return 0;
    }
    
    // arguments are number of processorss, n (size of array), distribution type
    int n_procs = atoi(argv[1]);
    int n = atoi(argv[2]); 
    int distribution_type = atoi(argv[3]);// 0 for sorted, 1 for sorted with 1% pertubed, 2 for random, 3 for reverse sorted
    int base = 10;

    if(rank== 0){
        cout << "Number of processes: " << size << endl;
        cout << "Number of elements: " << n << endl;
        cout << "Base: " << base << endl;
        cout << "Distribution type: " << distribution_type << endl;
    }
    
    adiak::init(NULL);
    adiak::launchdate();    // launch date of the job
    adiak::libraries();     // Libraries used
    adiak::cmdline();       // Command line used to launch the job
    adiak::clustername();   // Name of the cluster
    adiak::value("algorithm", string("Radix Sort")); // The name of the algorithm you are using (e.g., "merge", "bitonic")
    adiak::value("programming_model", string("mpi")); // e.g. "mpi"
    adiak::value("data_type", string("int")); // The datatype of input elements (e.g., double, int, float)
    adiak::value("size_of_data_type", (int)sizeof(int)); // sizeof(datatype) of input elements in bytes (e.g., 1, 2, 4)
    adiak::value("input_size", n); // The number of elements in input dataset (1000)
    adiak::value("input_type", distribution_type); // For sorting, this would be choices: ("Sorted", "ReverseSorted", "Random", "1_perc_perturbed")
    adiak::value("num_procs", size); // The number of processors (MPI ranks)
    adiak::value("scalability", string("strong")); // The scalability of your algorithm. choices: ("strong", "weak")
    adiak::value("group_num", int(13)); // The number of your group (integer, e.g., 1, 10)
    adiak::value("implementation_source", string("online and ai")); // Where you got the source code of your algorithm. choices: ("online", "ai", "handwritten").   
    
    // Allocate space for the array
    vector<int> arr(n);
    vector<int> sorted(n);
    auto parts = make_block_partition(n, size);
    vector<int> local_arr(parts[rank].size);

    CALI_MARK_BEGIN("main");

    CALI_MARK_BEGIN("_data_init_runtime_");
    //initialize array dependng on distribution type
    if (rank == 0){
        if(distribution_type == 0){
            for(int i = 0; i < n; ++i){
                arr[i] = i;
            }
        } else if(distribution_type == 1){
            srand(time(0));
            for(int i = 0; i < n; ++i){
                arr[i] = i;
            }
            int num_perturb = n / 100; //1% perturbation
            for(int i = 0; i < num_perturb; ++i){
                int idx1 = rand() % n;
                int idx2 = rand() % n;
                swap(arr[idx1], arr[idx2]);
            }
        } else if(distribution_type == 2){
            srand(time(0) + rank);
            for(int i = 0; i < n; ++i){
                arr[i] = rand() % MAXKEY;
            }
        } else if(distribution_type == 3){
            for(int i = 0; i < n; ++i){
                arr[i] = n - i;
            }
        }
    }
    CALI_MARK_END("_data_init_runtime_");


    // Scatter the array to all processes
    vector<int> scounts(size), sdispls(size);
    for (int p = 0; p < size; ++p) { 
        scounts[p] = parts[p].size; sdispls[p] = parts[p].start; 
    }
    CALI_MARK_BEGIN("comm");
    CALI_MARK_BEGIN("comm_large");
    CALI_MARK_BEGIN("MPI_Scatterv");
    MPI_Scatterv(arr.data(), scounts.data(), sdispls.data(), MPI_INT,
             local_arr.data(), parts[rank].size, MPI_INT, 0, MPI_COMM_WORLD);
    CALI_MARK_END("MPI_Scatterv");
    CALI_MARK_END("comm_large");
    CALI_MARK_END("comm");


    local_arr = radix_sort(local_arr, base, MPI_COMM_WORLD);

    // Gather the sorted subarrays back to the root process
    if(rank == 0){
        sorted.resize(n);
    }
    CALI_MARK_BEGIN("comm");
    CALI_MARK_BEGIN("comm_large");
    CALI_MARK_BEGIN("MPI_Gatherv");
    MPI_Gatherv(local_arr.data(), parts[rank].size, MPI_INT,
            rank == 0 ? sorted.data() : nullptr,
            scounts.data(), sdispls.data(), MPI_INT, 0, MPI_COMM_WORLD);
    CALI_MARK_END("MPI_Gatherv");
    CALI_MARK_END("comm_large");
    CALI_MARK_END("comm");

    CALI_MARK_BEGIN("correctness_check");
    //verify the array is sorted
    if (rank == 0) {
        // Verify the array is sorted
        bool sorted_correctly = true;
        for(int i = 1; i < sorted.size(); ++i){
            if(sorted[i] < sorted[i - 1]){
                sorted_correctly = false;
                break;
            }
        }
        if(sorted_correctly){
            cout << "Array sorted correctly" << endl;
        } else {
            cout << "Array not sorted correctly" << endl;
        }
    }
    CALI_MARK_END("correctness_check");
    
    
    CALI_MARK_BEGIN("MPI_Finalize");
    MPI_Finalize();
    CALI_MARK_END("MPI_Finalize");
    
    CALI_MARK_END("main");

    
    mgr.flush();
    mgr.stop();
    

    return 0;
}
