#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

../../grasem/run.bash brace2fb.grasem >_.js
cat _.js foreign.js >_brace2fb.js
node _brace2fb.js < ${target}.brace > ${target}.fb

