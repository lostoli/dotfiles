#!/bin/sh

FONT=$(xrdb -query | grep URxvt.font)

if $(echo "$FONT" | grep -q Iosevka); then
    H=18
else
    H=20
fi

HEIGHT="window.dimensions.lines=$H"
WIDTH="window.dimensions.columns=84"
X="window.position.x=0"
Y="window.position.y=0"

#check if mpd is running
if pgrep mpd >/dev/null 2>&1
  then
    #echo "mpd is running"
    alacritty -o $HEIGHT -o $WIDTH -o $X -o $Y -e ncmpcpp
  else
    # mpd is not running
	  mpd
    alacritty -o $HEIGHT -o $WIDTH -o $X -o $Y -e ncmpcpp
fi
