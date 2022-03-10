#!/bin/bash

if [ "$1" -eq "1" ]; then
    echo 1 > ~/.cache/dmenustate
    killall polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done
    bspc config top_padding 0 
elif [ "$1" -eq "2" ]; then 
    echo 0 > ~/.cache/dmenustate
    bspc config top_padding 28
    polybar candy &
    polybar candy_external &
else
    echo 1 > ~/.cache/dmenustate
    killall polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done
    bspc config top_padding 18
    polybar wide &
    polybar wide_external &
fi
