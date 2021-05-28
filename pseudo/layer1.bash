#!/bin/bash
set -e

PATH='./':$PATH
trap 'catch' ERR

catch () {
    echo '*** fatal error in run.bash'
    exit 1
}

linkID=`./getIDFromLayer layer0 layer1`
topID=`./getIDFromLayer layer0 layer0`
subDiagramID=`./getidfromLayer container1 container1`

(

    cat						< $1 ;
    senderIDs					< $1 ;
    receiverIDs					< $1 ;
    echo "orphan(${linkID},nil)."		     ;
    echo "contains(${topID},${subDiagramID})."       ;
    
    true
) | ./prologify.bash 
