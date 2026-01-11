!/usr/bin/env bash

size=$((2**16))
# --- 2^16 input size ---
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 0    # 0 for sorted

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 1    # 1 for 1% perturbed

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 2   # 2 for random
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 2    # 2 for random

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 3    # 3 for reverse sorted


size=$((2**18))
# --- 2^18 input size ---
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 0    # 0 for sorted

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 1   # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 1    # 1 for 1% perturbed

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 2    # 2 for random

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 3    # 3 for reverse sorted


size=$((2**20))
# --- 2^20 input size ---
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 0    # 0 for sorted

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 1    # 1 for 1% perturbed

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 2    # 2 for random

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 3    # 3 for reverse sorted


size=$((2**22))
# --- 2^22 input size ---
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 0    # 0 for sorted

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 1    # 1 for 1% perturbed

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 2    # 2 for random

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 3    # 3 for reverse sorted


size=$((2**24))
# --- 2^24 input size ---
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 0    # 0 for sorted

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 1    # 1 for 1% perturbed

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 2    # 2 for random

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 3    # 3 for reverse sorted


size=$((2**26))
# --- 2^26 input size ---
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 0    # 0 for sorted

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 1    # 1 for 1% perturbed

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 2    # 2 for random

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 3    # 3 for reverse sorted


size=$((2**28))
# --- 2^28 input size ---
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 0    # 0 for sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 0    # 0 for sorted

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 1    # 1 for 1% perturbed
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 1    # 1 for 1% perturbed

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 2    # 2 for random
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 2    # 2 for random

sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=2  RadixSort.grace_job 2 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=4  RadixSort.grace_job 4 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=8  RadixSort.grace_job 8 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=1 --ntasks-per-node=16 RadixSort.grace_job 16 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=16 RadixSort.grace_job 32 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=2 --ntasks-per-node=32 RadixSort.grace_job 64 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=4 --ntasks-per-node=32 RadixSort.grace_job 128 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=8 --ntasks-per-node=32 RadixSort.grace_job 256 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=16 --ntasks-per-node=32 RadixSort.grace_job 512 $size 3    # 3 for reverse sorted
sbatch --time=3:00:00 --nodes=32 --ntasks-per-node=32 RadixSort.grace_job 1024 $size 3    # 3 for reverse sorted
