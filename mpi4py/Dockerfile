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

#ENV     MY_TGT_DIR=/usr/src/pwdhash-vault
#RUN     set -x \
#        && mkdir -p ${MY_TGT_DIR}
#COPY    . ${MY_TGT_DIR}
#WORKDIR ${MY_TGT_DIR}
#
## install all dependencies and the application itself
#RUN  set -x \
#     && pip install .
#
## remove unused system packages to lower the image size
#RUN set -x \
#    && apt-get autoremove --purge -y gcc \
#    && apt-get autoremove --purge -y libsqlite3-dev
#
#EXPOSE 8080
#
#CMD ["python", "main.py"]
CMD ["/bin/bash", "-l"]
