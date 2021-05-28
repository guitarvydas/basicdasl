# Merge Container1 into Layer0
1. get id for synonym `layer1` in `layer0.pl`, save it in ID
2. Copy `container1.pl` to `temp.pl`
3. replace `container1_0` with ID in `temp.pl`

4. rewrite all arrows as specified

## Steps 1-3 - Merge
`getidfromsynonym layer0.pl container1`
`mergedas container1.pl layer0.pl temp.pl container1_0`

## Step 4 - Rewrite Arrows
`rewritearrow layer1/a hello/r temp.pl`
`rewritearrow layer1/b hello/s temp.pl`
	
## Done
Result is in `temp.pl`.


getidfromsynonym...
#!/bin/bash
# usage: getidfromsynonym <file (w/o .pl extension)> <synonym>
# e.g. getidfromsynonym layer0 layer1
swipl \
	-g "consult($1)" \
	-g "synonym(ID,$2),format("~w~n", [ID])." \
	-g "halt."

mergedas...
#!/bin/bash
# usage: mergedas container1 layer0 temp
cat $1.pl $2.pl >temp
sed -E -e '/contains/s/container1_0/layer0_3/g' <temp | sed -E -e '/^$/d' | sort >$3.pl

rewritearrow...
#!/bin/bash
# usage: `rewritearrow layer1/a hello/r temp.pl`
# usage: `rewritearrow layer1/b hello/s temp.pl`
sed -E -e "s/$1/$2/g" <$3 >temp
mv temp $3

done...
./run-qr.bash temp
