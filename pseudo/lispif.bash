#!/bin/bash
set -e
sed -E -e 's/]],/]],\
/g' <$1 \
    | sed -E -e 's/\[/(/g' \
    | sed -E -e 's/\]/)/g' \
    | sed -E -e 's/,/ /g' \
    | sed -E -e 's%_%/%g' \
	  > _.txt
sbcl --load pp.lisp --eval '(main)' < _.txt
echo

