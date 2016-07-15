#!/bin/bash

CUR_DIR="$( pwd )"

for bench in $(ls -d */); do
    cd ${CUR_DIR}/${bench}/src
    make run
done
