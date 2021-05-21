#!/bin/bash
set -e
cat engine_fb.pl complete_runnable_fb.pl >_.pl
sort _.pl > fb.pl

