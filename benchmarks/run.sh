#!/bin/bash

BASE_DIR="$( dirname $( readlink -f $0 ) )"

#
# this makes sense only if run as a Docker CMD
#
cd ${BASE_DIR}

for DIR in $(ls -d */); do
    cd ${BASE_DIR}/${DIR}src
    make run
done
