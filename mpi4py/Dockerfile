FROM python:3.4-slim

# make sure the MPI libraries are installed
RUN  apt-get update                          && \
     apt-get install -y libmpich-dev      \
                        mpich2            \
                     --no-install-recommends && \
     pip install mpi4py

# MPI program
WORKDIR /root
ADD     mpi_01.py mpi_01.py

CMD ["/bin/bash"]
