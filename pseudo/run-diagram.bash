#!/bin/bash
set -e
target=$1

trap 'catch' ERR

catch () {
    echo "*** fatal error in run-diagram.bash ${target}"
    exit 1
}

# create factbase for diagram 2. [${target}]
echo >_.pl
../../grasem/run.bash opml2fb.grasem >_.js
cat _.js foreign.js >_opml2fb.js
node _opml2fb.js < ${target}.opml >> _.pl

sort _.pl | grep -v '^$' > ${target}_fb.pl

swipl -q \
      -g "consult(${target}_fb)." \
      -g 'consult(q).' \
      -g 'printAllABegin(_).' \
      -g 'printAllAEnd(_).' \
      -g 'halt.' \
      > _2.pl

sort _2.pl >_3.pl
cat ${target}_fb.pl _3.pl > _.pl
cp _.pl ${target}_fb.pl

swipl -q \
      -g "consult(${target}_fb)." \
      -g 'consult(q).' \
      -g 'describeAllPorts.' \
      -g 'halt.' \
      > _4.pl

sort _4.pl >_5.pl
cat ${target}_fb.pl _5.pl > _.pl
cp _.pl ${target}_fb.pl
