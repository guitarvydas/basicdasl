#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

echo ${target}
# swipl \
#     -g "consult(${target})." \
#     -g "consult(r)." \
#     -g "consult(print)." \
#     -g 'printComponentIDs.' \
#     -g 'printComponents.' \
#     -g 'printLinks.' \
#     -g 'printArrows.' \
#     -g 'halt.'
swipl \
    -g "consult(${target})." \
    -g "consult(r)." \
    -g "consult(print_L2)." \
    -g 'printComponentIDs_L2.' \
    -g 'printComponents_L2.' \
    -g 'printLinks_L2.' \
    -g 'printArrows_L2.' \
    -g 'halt.'
echo
