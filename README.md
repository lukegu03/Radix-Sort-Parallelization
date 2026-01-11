# MPI Radix Sort — Parallel Performance Study (Caliper + Adiak + Thicket)

This repository contains my **MPI-based distributed Radix Sort implementation** and a performance evaluation comparing scaling behavior across multiple input sizes, input distributions, and MPI process counts. This repository also compares my Radix Sort implementation with that of other parallelized sorting algorithms created by peers. The work focuses on **high-performance computing (HPC)** concerns: communication overheads, collective operations, and strong/weak scaling trends.

> **Algorithm implemented in this repo:** MPI Radix Sort  
> Related comparison algorithms in the full project: MPI Merge Sort, MPI Sample Sort (not included here)

---

## Contents

- `Algorithms/`  
  MPI Radix Sort source code (C/C++) and build/run scripts
- `Performance_Evaluation/`  
  Generated plots for strong scaling, weak scaling, and speedup analyses
- `Report.md` 
  Full written report describing methodology/pseudocode, evaluation plan, and results
- `Data/` 
  Collected `.cali` performance traces for experiments
- `notebooks/` 
  Thicket/Jupyter analysis used to generate strong scaling plots

---

## Project Summary

Radix Sort is attractive for integers because it performs sorting via digit passes rather than comparisons (unlike the other sorting algorithms discussed in Report.md). For an MPI-based parallelization of Radix Sort, the challenge is that each digit pass requires redistributing elements among ranks, which typically involves **all-to-all communication**.

This implementation:
- Distributes the global array across MPI ranks
- Iterates digit-by-digit
- Builds per-rank histograms
- Computes global bucket offsets
- Redistributes elements using `MPI_Alltoallv`

The evaluation emphasizes:
- How well computation scales with more ranks
- Where communication dominates
- How performance changes for different input distributions (sorted, reverse sorted, random, and 1% perturbed)

---

## MPI Radix Sort Approach (High-Level)

Per digit pass:
1. **Local histogram** for digit buckets  
2. **Global histogram** via `MPI_Allreduce`  
3. **Prefix sum** to determine global bucket ranges  
4. Compute send counts per destination rank  
5. Exchange counts using `MPI_Alltoall`  
6. Redistribute elements using `MPI_Alltoallv`

For more information, see Report.md.

---

## Instrumentation (Caliper Calltree + Adiak Metadata)

This code is instrumented using **Caliper** regions and **Adiak** metadata to support reproducible analysis in **Thicket**. For more information, see Report.md.

### Caliper calltree structure

1.101 main
├─ 0.837 MPI_Init
└─ 0.263 main
   ├─ 0.000 _data_init_runtime_
   ├─ 0.096 comm
   │  └─ 0.096 comm_large
   │     ├─ 0.096 MPI_Scatterv
   │     └─ 0.000 MPI_Gatherv
   ├─ 0.166 radix_sort
   │  ├─ 0.162 comm
   │  │  ├─ 0.159 comm_small
   │  │  │  └─ 0.159 MPI_Allreduce
   │  │  └─ 0.003 comm_large
   │  │     ├─ 0.000 MPI_Alltoall
   │  │     └─ 0.003 MPI_Alltoallv
   │  └─ 0.004 comp
   │     ├─ 0.003 comp_small
   │     │  └─ 0.002 comm
   │     │     └─ 0.002 comm_small
   │     │        └─ 0.001 MPI_Exscan
   │     └─ 0.001 comp_large
   └─ 0.000 correctness_check
```