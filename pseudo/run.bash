#!/bin/bash
set -e
echo >_.pl
../../grasem/run.bash opml2fb.grasem >_.js
cat foreign.js _.js >_opml2fb.js
node _opml2fb.js < diagrams.opml >> _.pl

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
