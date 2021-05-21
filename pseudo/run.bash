#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

./run-diagram.bash complete_runnable

./run-diagram.bash engine

./describe.bash complete_runnable_fb
./describe.bash engine_fb

./combine-fbs.bash


echo


