#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-lisp.bash'
    exit 1
}

../../grasem/run.bash md2lisp.grasem >_.js
cat _.js foreign.js >_md2lisp.js
node _md2lisp.js < ${target}.md > ${target}.lisp
