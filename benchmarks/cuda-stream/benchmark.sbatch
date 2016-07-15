#!/bin/bash -l
#SBATCH --job-name="shifter-gpu_benchmark"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:05:00
#SBATCH 

module load slurm
echo "Launching GPU stream benchmark on $( hostname ) ..."

srun shifter --image=docker:lichinka/shifter-gpu:7.3                         \
             /usr/local/src/stream
