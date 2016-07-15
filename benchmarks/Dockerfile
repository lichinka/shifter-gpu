FROM ubuntu:14.04
MAINTAINER cscs

#RUN apt-get update --fix-missing                    && \
#    apt-get install -y --no-install-recommends wget
#
#RUN wget -q -O - http://developer.download.nvidia.com/compute/cuda/repos/GPGKEY | apt-key add - && \
#    echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
#    apt-get update
#
#ENV CUDA_VERSION 7.0
#LABEL com.nvidia.cuda.version="7.0"
#
#RUN apt-get install -y --no-install-recommends --force-yes "cuda-toolkit-7.0" gpu-deployment-kit
#
#RUN echo "/usr/local/cuda/lib" >> /etc/ld.so.conf.d/cuda.conf && \
#    echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf && \
#    ldconfig
#
#RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
#    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
#
#RUN mkdir -p /usr/local/nvidia/lib   && \
#    mkdir -p /usr/local/nvidia/lib64

ENV PATH /usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

WORKDIR /usr/local/src

ADD . benchmarks

CMD ['/usr/local/src/stream']
