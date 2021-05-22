#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

../../grasem/run.bash md2block.grasem >_.js
cat _.js foreign.js >_md2block.js
node _md2block.js < ${target}.md > ${target}.block
