#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

echo ${target}
swipl \
    -g "consult(${target})." \
    -g "consult(r)." \
    -g "consult(print)." \
    -g 'printComponentIDs.' \
    -g 'printComponents.' \
    -g 'printLinks.' \
    -g 'printArrows.' \
    -g 'halt.'
echo
