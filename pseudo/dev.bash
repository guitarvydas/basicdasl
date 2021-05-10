#!/bin/bash
set -e
echo >_.pl
../../grasem/run.bash opml2fb.grasem >_.js
cat foreign.js _.js >_opml2fb.js
node _opml2fb.js < test.opml >> _.pl

sort _.pl > fb.pl
#cat fb.pl
cat _.pl

