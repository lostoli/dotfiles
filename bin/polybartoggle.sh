#!/bin/bash

if [ "$1" -eq "1" ]; then
    echo 1 > ~/.cache/dmenustate && killall polybar && sleep 0.5s && bspc config top_padding 0 
elif [ "$1" -eq "2" ]; then 
    echo 0 > ~/.cache/dmenustate && bspc config top_padding 28 && polybar candy 
else
    echo 1 > ~/.cache/dmenustate && killall polybar && sleep 0.5s && bspc config top_padding 18 && polybar wide
fi
