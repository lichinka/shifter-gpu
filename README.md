# shifter-gpu
Testbed for Shifter with GPU support

## Execution
In a SLURM-enabled environment, just issue:

$> sbatch benchmarks.batch

The output should contain the performance figures of several benchmarks, as well as `nvidia-smi -q`.


## Untested features
- MPS to share up to 16 containers on one GPU device
- RDMA: testing on K80, use deviceQuery to double check the output of nvidia-smi.
