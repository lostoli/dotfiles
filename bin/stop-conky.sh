#!/bin/bash

ST=$(ps -aux | grep -c c[o]nkyrc-mpd)
PI=$(ps -aux | grep c[o]nkyrc-mpd | awk '{print $2}')

if [ "$ST" -ge 1 ]; then
	#echo "conky-mpd is running"
	kill -9 "$PI"
fi
	 
