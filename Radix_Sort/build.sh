#!/bin/bash

module load intel/2022a
module load CMake/3.12.1
module load GCCcore/12.2.0
module load PAPI/7.0.1

cmake \
    -Dcaliper_DIR=/scratch/group/csce-435-f25/Caliper/caliper/share/cmake/caliper \
    -Dadiak_DIR=/scratch/group/csce-435-f25/Adiak/adiak/lib/cmake/adiak \
    .

make