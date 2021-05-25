#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-block.bash'
    exit 1
}

node _md2block.js < ${target}.md > ${target}.block
