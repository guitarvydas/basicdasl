#!/bin/bash
# join two .pl files and re-sort into the final .pl file
# inputs: $1, $2
# output: $3.pl
cat $1.pl $2.pl > _temp
sort _temp >$3.pl
