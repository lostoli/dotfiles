#!/bin/sh

FONT=$(xrdb -query | grep URxvt.font)

if $(echo "$FONT" | grep -q Iosevka); then
    H=306
else
    H=300
fi

pkill -f ALBUMCOVER!!!
P=$(mpc -f %file% | head -1)
T="/home/oli/.cache/mpd.jpg"

#echo $P

NP=$(dirname "/home/oli/music/Music/$P")

#echo $NP

CP="$NP/cover.jpg"
[ -f "$CP" ] && \
(bspc rule -a feh -o state=floating desktop=^1 focus=off && \
feh -N -. -^ ALBUMCOVER!!! --zoom fill -g "$H"x"$H"+100+60 "$CP")
