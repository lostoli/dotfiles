#!/bin/sh

pkill -f ALBUMCOVER!!!
P=$(mpc -f %file% | head -1)
T="/home/oli/.cache/mpd.jpg"

#echo $P

NP=$(dirname "/home/oli/stuff/Music/$P")

#echo $NP

CP="$NP/cover.jpg"
[ -f "$CP" ] && \
(bspc rule -a feh -o state=floating desktop=^1 focus=off && \
feh -N -. -^ ALBUMCOVER!!! --zoom fill -g 300x300+100+60 "$CP")
