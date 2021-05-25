#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

../../grasem/run.bash fb2pl.grasem >_.js
cat _.js foreign.js >_fb2pl.js
node _fb2pl.js < ${target}.fb > ${target}._pl
sort ${target}._pl >${target}.pl

