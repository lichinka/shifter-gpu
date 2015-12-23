FROM python:3.4-slim

# make sure the MPI libraries are installed
RUN  apt-get update                          && \
     apt-get install -y libmpich-dev      \
                        mpich2            \
                     --no-install-recommends && \
     pip install mpi4py

# MPI program
WORKDIR /usr/local/src
ADD     mpi_01.py  mpi_01.py
ADD     test_mpi.c test_mpi.c
RUN     mpicc test_mpi.c -o /usr/local/bin/test_mpi

CMD ["python", "/usr/local/src/mpi_01.py"]
