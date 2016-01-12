## Open questions

* Found one case in which the container recipe does not work, i.e.:
1. log into `greina24`;
2. export `PATH=${PATH}:/usr/local/cuda/bin` and `LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64`;
3. cd into `${HOME}/tmp/stream`, `make` and execute `./stream`; 
4. pull the image `lichinka:shifter-gpu:7.3` which contains an implementation of the Stream benchmark;
5. cd into `${HOME}/nvidia-docker` and launch the container `./nvidia-docker --rm=true -it docker.io/lichinka/shifter-gpu:7.3 /usr/local/src/stream`

* Low performance if using RDMA between containers: multiple and single host testing show the same bad performance, e.g.:

>>>>> add tests from Greina

* Which features of the Nvidia Driver for CUDA 7.x can we manipulate through the control groups interface and how?
* In theory this should give us the possibility of deploying multiple containers on one device, each with its own set of limited resources: is this possible? If yes, can we get a working example of this funcionality?
* What about indirect communication between containers through the device? E.g. by accessing read-only texture memory?
