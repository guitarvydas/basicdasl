#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}


./run-diagram.bash engine

./dev-describe.bash engine_fb


echo


