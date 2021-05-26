#!/bin/bash
set -x
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

./build_grasem.bash

./run-block.bash layer0
./run-block.bash container1


./run-block2lisp.bash layer0
./run-block2lisp.bash container1

./run-block2brace.bash layer0
./run-block2brace.bash container1

./run-brace2fb.bash layer0
./run-brace2fb.bash container1

./run-fb2pl.bash layer0
./run-fb2pl.bash container1

# cat layer0.pl
