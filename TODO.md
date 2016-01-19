## Open questions

* Found one case in which the container recipe does not work; to execute the native implementation:
```
ssh -YC greina24
export PATH=${PATH}:/usr/local/cuda/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64
cd ${HOME}/tmp/stream_benchmark
make
./stream
```
* To execute the containerized implementation:
```
docker pull lichinka/shifter-gpu:7.3
cd ${HOME}/nvidia-docker
./nvidia-docker --rm=true -it docker.io/lichinka/shifter-gpu:7.3 /usr/local/src/stream
```
* Low performance if using RDMA between containers: multiple and single host testing show the same bad performance.
* Follow these steps to perform native P2P tests on `greina20`:
```
module load mvapich2/gcc/64/2.0b cuda70/toolkit/7.0.28
cd $HOME/src
tar xvzf osu-micro-benchmarks-4.4.tar.gz
cd osu-micro-benchmarks-4.4
./configure --prefix=${HOME}/osu-benchmarks CC=$( which mpicc ) --enable-cuda --with-cuda-include=${CUDA_PATH}/include --with-cuda-libpath=${CUDA_PATH}/lib64
make
make install
cd $HOME
./benchmark_orion.sh
```

>>>>> add tests from Greina

* Which features of the Nvidia Driver for CUDA 7.x can we manipulate through the control groups interface and how?
* In theory this should give us the possibility of deploying multiple containers on one device, each with its own set of limited resources: is this possible? If yes, can we get a working example of this funcionality?
* What about indirect communication between containers through the device? E.g. by accessing read-only texture memory?
