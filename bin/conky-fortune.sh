#! /bin/bash

fort1=$(fortune | tr '\n' ' ' | tr '\t' ' ' | fold -w 38 -s)
#echo -e $fort1

echo -e "$fort1" > .cache/fortune

lines=$(wc -l < .cache/fortune)

#echo $lines

if [ "$lines" -gt "18" ]
	then

	cp .cache/fortune .cache/fortune2
	sed -i -e 19,"$lines"d .cache/fortune
	sed -i -e 1,18d .cache/fortune2

elif [ "$lines" -le "18" ]
	then

	> .cache/fortune2
fi
