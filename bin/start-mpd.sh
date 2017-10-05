#!/bin/sh

FONT=$(xrdb -query | grep URxvt.font)

if $(echo "$FONT" | grep -q Iosevka); then
    H=18
else
    H=20
fi


#check if mpd is running
if pgrep mpd >/dev/null 2>&1
  then
     #echo "mpd is running"
	 #urxvt -e "bash -i start-ncmpcpp.sh"
     urxvtc -g 84x$H+414+61 -e ncmpcpp
  else
     # mpd is not running
	mpd
	urxvtc -g 84x$H+414+61 -e ncmpcpp
fi
