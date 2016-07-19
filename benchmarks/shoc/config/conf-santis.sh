#!/bin/bash -l

# Santis is a Cray XC30 with NVIDIA K20X (Kepler) GPUs, one per node.

# In the following, we are building with the Cray compiler drivers (named
# cc for C, CC for C++).  These drivers know how to find CUDA and OpenCL, 
# as long as the CUDA module is loaded when we configure, and they also know 
# how to build MPI programs.
# However, during configuration the autoconf script tries to run the 
# executables it builds and since we expect to be building on the login node,
# some of the libraries the compiler driver links in are not available
# for running the program.
# Thus, we must trick configure into thinking we are cross compiling.  The
# --host flag is how we indicate we are cross compiling.

# A typical build might look like:
# $ module swap PrgEnv-pgi PrgEnv-gnu
# $ module load craype-accel-nvidia35
# $ ./config/conf-santis.sh
# $ make

# We explicitly pass MPICXX variable because the SHOC configure script
# only tries more common MPI C++ compiler names like mpicxx.

# We explicitly pass a value in the CUDA_CPPFLAGS environment variable 
# to limit the number of CUDA architectures the SHOC build will support.
# We do this mainly to reduce the amount of time it takes to build SHOC,
# though it has some beneficial effect on the final sizes of the executables
# compared to the default.
# 
#
#========================================
# MODULE SETUP
#========================================
if [ -z "$( module list 2>&1 | grep PrgEnv-gnu )" ]; then
    module swap PrgEnv-cray PrgEnv-gnu;
fi
module load   craype-accel-nvidia35
module unload cudatoolkit/7.5.18-1.0502.10743.2.1
module load   cudatoolkit/7.0.28-1.0502.10742.5.1

#========================================
# CONFIGURATION
#========================================
CC=cc \
CXX=CC \
MPICXX=CC \
sh ./configure \
CUDA_CPPFLAGS="-gencode=arch=compute_35,code=sm_35" \
--host=x86_64-unknown-linux-gnu \
--with-opencl \
--with-cuda \
--with-mpi

