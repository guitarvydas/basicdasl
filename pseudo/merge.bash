#!/bin/bash
set -e

PATH='./':$PATH
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

(

  cat layer0.pl
  cat container1.pl

) | prologify.bash
