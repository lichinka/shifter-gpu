#!/bin/bash -l
#SBATCH --job-name="shifter_stream_benchmark"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:30:00
#SBATCH --exclusive
#SBATCH --output=/scratch/santis/lucasbe/jobs/shifter-gpu.out.log
#SBATCH --error=/scratch/santis/lucasbe/jobs/shifter-gpu.err.log
#SBATCH --image=docker:lichinka/shifter-gpu:7.3

module load slurm
echo "Launching GPU stream benchmark on $( hostname ) ..."

srun shifter                                                   \
     -V /opt/cray/nvidia/default/bin:/usr/local/bin            \
     -V /opt/cray/nvidia/default/lib64:/usr/local/nvidia/lib64 \
     /usr/local/src/stream
