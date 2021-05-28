#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

set -x

./build_grasem.bash

./input.bash
./output.bash
