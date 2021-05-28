#!/bin/bash
set -e
PATH='./':$PATH
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}


aport=`./getIDFromLayer layer0 layer1_a`
bport=`./getIDFromLayer layer0 layer1_b`
xport=`./getIDFromLayer container1 x`
yport=`./getIDFromLayer container1 y`
(

    cat						< $1 ;
    reroutearrows ${aport} ${xport}		< $1 ;
    reroutearrows ${bport} ${yport}		< $1 ;
    
    true
) | ./prologify.bash

### result is in fb.pl


# qr <fb.pl
