#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

../../grasem/run.bash block2brace.grasem >_.js
cat _.js foreign.js >_block2brace.js
node _block2brace.js < ${target}.block > ${target}.brace
