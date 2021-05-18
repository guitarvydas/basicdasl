#!/bin/bash
set -e
clear

# create factbase for diagram 2. [complete runnable]
echo >_.pl
../../grasem/run.bash opml2fb.grasem >_.js
cat foreign.js _.js >_opml2fb.js
node _opml2fb.js < complete-runnable.opml >> _.pl

sort _.pl | grep -v '^$' > complete_runnable_fb.pl

swipl -q \
      -g 'consult(complete_runnable_fb).' \
      -g 'consult(q).' \
      -g 'printAllABegin(_).' \
      -g 'printAllAEnd(_).' \
      -g 'halt.' \
      > _2.pl

sort _2.pl >_3.pl
cat complete_runnable_fb.pl _3.pl > _.pl
cp _.pl complete_runnable_fb.pl

# Yes, yes, we could glom all of the swipl queries into one command, BUT, one of the points, here, is the layering (cascading) of software components (including .bash scripts).  Small is good.  Many pieces is good.  Big has too many details to grok.  All-in-one has too many details to grok.  Details kill (https://guitarvydas.github.io/2021/03/17/Details-Kill.html).

swipl -q \
      -g 'consult(complete_runnable_fb).' \
      -g 'consult(q).' \
      -g 'describeAllPorts.' \
      -g 'halt.' \
      > _4.pl

sort _4.pl >_5.pl
cat complete_runnable_fb.pl _5.pl > _.pl
cp _.pl complete_runnable_fb.pl


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

cat engine_fb.pl complete_runnable_fb.pl >_.pl
sort _.pl > fb.pl

swipl \
    -g 'consult(engine_fb).' \
    -g 'consult(q).' \
    -g 'describeArrows.' \
    -g 'halt.'

