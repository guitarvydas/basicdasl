#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

node _fb2pl.js < ${target}.fb > ${target}._pl
sort ${target}._pl | sed -E -e '/^$/d' >${target}.pl

