#!/bin/bash
set -e
trap 'catch' ERR
target=$1
catch () {
    echo '*** fatal error in run-block.bash'
    exit 1
}

../../grasem/run.bash md2block.grasem >_.js
cat _.js foreign.js >_md2block.js

../../grasem/run.bash block2brace.grasem >_.js
cat _.js foreign.js >_block2brace.js

../../grasem/run.bash brace2fb.grasem >_.js
cat _.js foreign.js >_brace2fb.js

../../grasem/run.bash fb2pl.grasem >_.js
cat _.js foreign.js >_fb2pl.js
