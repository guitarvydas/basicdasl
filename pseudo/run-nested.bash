#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-nested.bash'
    exit 1
}

../../grasem/run.bash md2nested.grasem >_.js
cat _.js foreign.js >_md2nested.js
node _md2nested.js < ${target}.md > ${target}.nested
