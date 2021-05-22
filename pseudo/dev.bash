#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in dev.bash'
    exit 1
}

./run-block.bash test
./run-block2brace.bash test
cat test.brace
