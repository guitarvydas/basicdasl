#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in dev.bash'
    exit 1
}
target=$1
./run-block.bash ${target}
./run-block2brace.bash ${target}
./run-brace2fb.bash ${target}
./run-fb2pl.bash ${target}

./run-qr.bash ${target}

