#!/bin/bash
set -e

PATH='./':$PATH
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

#./build_grasem.bash

block layer0
block container1

block2brace layer0
block2brace container1

brace2fb layer0
brace2fb container1

fb2pl layer0
fb2pl container1

# created layer0.pl, container1.pl
