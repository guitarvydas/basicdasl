#!/bin/bash
set -e
# create factbase for diagram 1. [engine]
echo >_.pl
../../grasem/run.bash opml2fb.grasem >_.js
cat foreign.js _.js >_opml2fb.js
node _opml2fb.js < engine.opml >> _.pl

sort _.pl | grep -v '^$' > engine_fb.pl

swipl -q \
      -g 'consult(engine_fb).' \
      -g 'consult(q).' \
      -g 'printAllABegin(_).' \
      -g 'printAllAEnd(_).' \
      -g 'halt.' \
      > _2.pl

sort _2.pl >_3.pl
cat engine_fb.pl _3.pl > _.pl
cp _.pl engine_fb.pl

swipl -q \
      -g 'consult(engine_fb).' \
      -g 'consult(q).' \
      -g 'describeAllPorts.' \
      -g 'halt.' \
      > _4.pl

sort _4.pl >_5.pl
cat engine_fb.pl _5.pl > _.pl
cp _.pl engine_fb.pl
