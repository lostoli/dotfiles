#!/bin/bash
# Recommend syntax for setting an infinite while loop
while :
do
	sleep 10s
	ST=$(cat ~/.cache/conky-stat)
	#echo "$ST"
	if [ "$ST" -eq 1 ]; then
		sh ~/bin/start-conky.sh
	else
		sh ~/bin/stop-conky.sh
	fi
done