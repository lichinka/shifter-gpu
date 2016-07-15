#!/bin/bash

BASE_DIR="$( dirname $0 )"

#
# this makes sense only if run as a Docker CMD
#
cd ${BASE_DIR}

for bench in $(ls -d */); do
    cd ${BASE_DIR}/${bench}src
    make run
done
