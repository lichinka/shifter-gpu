## Open questions

* Low performance if using RDMA between containers: multiple and single host testing show the same bad performance, e.g.:

>>>>> add tests from Greina

* Which features of the Nvidia Driver for CUDA 7.x can we manipulate through the control groups interface and how?
* In theory this should give us the possibility of deploying multiple containers on one device, each with its own set of limited resources: is this possible? If yes, can we get a working example of this funcionality?
* What about indirect communication between containers through the device? E.g. by accessing read-only texture memory?
