#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

./run-block.bash v
./run-block.bash v_x
./run-block.bash v_x_y
./run-block.bash v_x_y_z


./run-block2lisp.bash v
./run-block2lisp.bash v_x
./run-block2lisp.bash v_x_y
./run-block2lisp.bash v_x_y_z

./run-block2brace.bash v
./run-block2brace.bash v_x
./run-block2brace.bash v_x_y
./run-block2brace.bash v_x_y_z

./run-brace2fb.bash v
./run-brace2fb.bash v_x
./run-brace2fb.bash v_x_y
./run-brace2fb.bash v_x_y_z

./run-fb2pl.bash v
./run-qr.bash v
./run-fb2pl.bash v_x
./run-qr.bash v_x
./run-fb2pl.bash v_x_y
./run-qr.bash v_x_y
./run-fb2pl.bash v_x_y_z
./run-qr.bash v_x_y_z

# v/x is the most complicated diagram
# cat v_x.pl
