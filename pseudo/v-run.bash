#!/bin/bash
set -x
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

./build_grasem.bash

./run-block.bash v
./run-block.bash c2
./run-block.bash c3
./run-block.bash c4


./run-block2lisp.bash v
./run-block2lisp.bash c2
./run-block2lisp.bash c3
./run-block2lisp.bash c4

./run-block2brace.bash v
./run-block2brace.bash c2
./run-block2brace.bash c3
./run-block2brace.bash c4

./run-brace2fb.bash v
./run-brace2fb.bash c2
./run-brace2fb.bash c3
./run-brace2fb.bash c4

./run-fb2pl.bash v
./run-fb2pl.bash c2
./run-fb2pl.bash c3
./run-fb2pl.bash c4

# v/x is the most complicated diagram
# cat v_x.pl
