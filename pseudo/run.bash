#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

./build_grasem.bash

./block layer0
./block container1

./block2brace layer0
./block2brace container1

./brace2fb layer0
./brace2fb container1

./fb2pl layer0
./fb2pl container1


fb1=layer0.fb
fb2=container1.fb
linkid=`./getidfromsynonym layer0 layer1`
topid=`./getidfromsynonym layer0 layer0`
subid=`./getidfromsynonym container1 container1`
cat ${fb1} ${fb2} >temp.fb
./orphan ${linkid} >>temp.fb
./contains ${topid} ${subid} >>temp.fb

./fb2pl temp
./qr_L2 temp
echo "TODO: rewrite arrows"
