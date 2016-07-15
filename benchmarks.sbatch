#!/bin/bash -l
#
#SBATCH --job-name="shifter-gpu-benchmarks"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:10:00

module load shifter/20160627
echo "Launching Shifter GPU benchmarks on $( hostname ) ..."

srun shifter --image=docker:lichinka/shifter-gpu:benchmarks.0.1
