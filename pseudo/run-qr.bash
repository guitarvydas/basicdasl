#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-blocks.bash'
    exit 1
}

echo ${target}
swipl \
    -g "consult(${target})." \
    -g "consult(r)." \
    -g 'setof(ID,component(ID),Bag),format("component IDs ~w~n", [Bag]).' \
    -g 'setof([ID,Syn],(component(ID),synonym(ID,Syn)),Bag),maplist(second,Bag,Items),format("components    ~w~n", [Items]).' \
    -g 'setof([P,Syn],(port(P),synonym(P,Syn)),Bag),maplist(second,Bag,Items),format("ports ~w~n", [Items]).' \
    -g 'setof([ID,Syn],(link(ID),synonym(ID,Syn)),Bag),maplist(second,Bag,Items),format("links ~w~n", [Items]).' \
    -g 'setof([ID,L],(composite(ID),arrows(ID,L)),Bag)*->(maplist(second,Bag,Items),format("arrows ~w~n", [Items])) ; format("(no arrows)~n",[]).' \
    -g 'halt.'
echo
