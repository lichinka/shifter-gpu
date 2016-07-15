#!/bin/bash -l
#SBATCH --job-name="shifter-gpu"
#SBATCH --nodes=1
#SBATCH --partition=ccm
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:30:00
#SBATCH --exclusive
#SBATCH --output=/scratch/santis/lucasbe/jobs/shifter-gpu.out.log
#SBATCH --error=/scratch/santis/lucasbe/jobs/shifter-gpu.err.log
#SBATCH --image=docker:deis/helloworld:latest
#SBATCH --autoshift

module load slurm
module load shifter
module load ccm
export PBS_JOBID=$SLURM_JOBID
echo "Launching ${PBS_JOBID} on $( hostname ) ..."

#
# By adding --volume, we allow RW access to that folder!
# However, volumes defined with --imagevolume at the SBATCH level are RO
# Note that 'mount' does not show any of these volumes a mountpoints
#ccmrun shifter --volume=${SCRATCH}:${SCRATCH} ./shifter_python.bash
ccmrun shifter --verbose                      \
               ./run.sh
