#!/bin/bash
set -e
echo >_.pl
../../grasem/run.bash opml2fb.grasem >_.js
cat foreign.js _.js >_opml2fb.js
node _opml2fb.js < diagrams.opml >> _.pl

sort _.pl > fb.pl
#cat fb.pl
swipl -q \
      -g 'consult(fb).' \
      -g 'consult(q).' \
      -g 'printAllABegin.' \
      -g 'halt.'
# I don't understand: if we try to printAllABegin and printAllAEnd in the same script, we get only the first set of output
swipl -q \
      -g 'consult(fb).' \
      -g 'consult(q).' \
      -g 'printAllAEnd.' \
      -g 'halt.'
