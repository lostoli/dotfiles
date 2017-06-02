#!/bin/bash

#sleep 3 &&
#conky -d -c /home/oli/.conkyrc &
#sleep 4 &&

ST=$(ps -aux | grep -c c[o]nkyrc-mpd)

if [ "$ST" == 0 ]; then
	conky -d -c /home/oli/.conkyrc-mpd
fi 
