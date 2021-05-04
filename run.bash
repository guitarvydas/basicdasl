#!/bin/bash
target=basic1
set -e
echo >_.pl
../grasem/run.bash dasl.grasem >_.js
cat foreign.js _.js >_dasl.js
node _dasl.js < $target.dasl >> _.pl

awk -f name-mangling.awk < _.pl | sort > fb.pl
cat fb.pl


