#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

./run-block.bash v
./run-block.bash v-x
./run-block.bash v-x-y
./run-block.bash v-x-y-z


./run-block2lisp.bash v
./run-block2lisp.bash v-x
./run-block2lisp.bash v-x-y
./run-block2lisp.bash v-x-y-z
# v/x is the most complicated diagram
cat v-x.lisp
