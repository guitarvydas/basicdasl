#!/bin/bash
set -e
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

#./build_grasem.bash

./run-block.bash layer0
./run-block.bash container1


./run-block2lisp.bash layer0
./run-block2lisp.bash container1

./run-block2brace.bash layer0
./run-block2brace.bash container1

./run-brace2fb.bash layer0
./run-brace2fb.bash container1

./run-fb2pl.bash layer0
./run-fb2pl.bash container1

fb1=layer0.fb
fb2=container1.fb
linkid=`./getidfromsynonym layer0 layer1`
topid=`./getidfromsynonym layer0 layer0`
subid=`./getidfromsynonym container1 container1`
cat ${fb1} ${fb2} >temp.fb
./orphan ${linkid} >>temp.fb
./contains ${topid} ${subid} >>temp.fb

./run-fb2pl.bash temp
./run-qr_L2.bash temp
echo "TODO: rewrite arrows"

# topid=container1_0
# # usage: mergedas container1 layer0 ${linkid} ${mergeid} ${linkname} temp
# fb1=container1
# fb2=layer0
# mergeid=${fb1}_0
# ------
# topid=${linkid}_orphan
# fbresult=merged

# ./mergedas ${fb1} ${fb2} ${linkid} ${mergeid} ${linkname} ${fbresult}

# ./rewritearrow layer1_a hello_r ${fbresult}
# ./rewritearrow layer1_b hello_s ${fbresult}

# ./run-qr.bash temp


