#!/bin/bash
set -e

PATH='./':$PATH
trap 'catch' ERR

catch () {
    echo '*** fatal error in output.bash'
    exit 1
}

./merge.bash         >fb0.pl
./layer1.bash fb0.pl >fb1.pl
./layer2.bash fb1.pl >fb2.pl
