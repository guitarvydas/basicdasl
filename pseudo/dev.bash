#!/bin/bash
set -e

PATH='./':$PATH
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

#./build_grasem.bash

block layer0
block container1

block2brace layer0
block2brace container1

brace2fb layer0
brace2fb container1

fb2pl layer0
fb2pl container1

# created layer0.pl, container1.pl

cat layer0.pl container1.pl | ./removeBlankLines | sort > fb0.pl

##
## layer 2
##

linkID=`./getIDFromLayer layer0 layer1`
topID=`./getIDFromLayer layer0 layer0`
subDiagramID=`./getidfromLayer container1 container1`

(

    cat						< fb0.pl ;
    senderIDs					< fb0.pl ;
    receiverIDs					< fb0.pl ;
    echo "orphan(${linkID},nil)."			 ;
    echo "contains(${topID},${subDiagramID})."           ;
    
    true
) | ./removeBlankLines | sort > fb1.pl

aport=`./getIDFromLayer layer0 layer1_a`
bport=`./getIDFromLayer layer0 layer1_b`
xport=`./getIDFromLayer container1 x`
yport=`./getIDFromLayer container1 y`
(

    cat						< fb1.pl ;
    reroutearrows ${aport} ${xport}		< fb1.pl ;
    reroutearrows ${bport} ${yport}		< fb1.pl ;
    
    true
) | ./removeBlankLines | sort > fb.pl

### result is in fb.pl


# qr <fb.pl
