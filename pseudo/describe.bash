#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo "*** fatal error in describe.bash $1"
    exit 1
}
swipl \
    -g "consult($1)." \
    -g 'consult(q).' \
    -g 'describeForeignComponents.' \
    -g 'halt.'


swipl \
    -g "consult($1)." \
    -g 'consult(q).' \
    -g 'printConnections.' \
    -g 'halt.' \
    > _.txt

sed -E -e 's/]],/]],\
/g' <_.txt \
    | sed -E -e 's/\[/(/g' \
    | sed -E -e 's/\]/)/g' \
    | sed -E -e 's/,/ /g' \
    | sed -E -e 's%_%/%g' \
	  > _2.txt
sbcl --load pp.lisp --eval '(main)' < _2.txt
echo
