#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

node _block2brace.js < ${target}.block > ${target}.brace
