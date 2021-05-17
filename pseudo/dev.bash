#!/bin/bash
set -e

# create factbase for diagram 1. [engine]
echo >_.pl
../../grasem/run.bash opml2fb.grasem >_.js
cat foreign.js _.js >_opml2fb.js
node _opml2fb.js < ???.opml >> _.pl

sort _.pl | grep -v '^$' > fb.pl

swipl -q \
      -g 'consult(fb).' \
      -g 'consult(q).' \
      -g 'printAllABegin(_).' \
      -g 'printAllAEnd(_).' \
      -g 'halt.' \
      > _2.pl

sort _2.pl >_3.pl
cat fb.pl _3.pl > _.pl
cp _.pl fb.pl

swipl -q \
      -g 'consult(fb).' \
      -g 'consult(q).' \
      -g 'describeAllPorts.' \
      -g 'halt.' \
      > _4.pl

sort _4.pl >_5.pl
cat fb.pl _5.pl > _.pl
cp _.pl complete-runnable-fb.pl
