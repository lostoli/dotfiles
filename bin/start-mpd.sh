#!/bin/sh

#check if mpd is running
if pgrep mpd >/dev/null 2>&1
  then
     #echo "mpd is running"
	 #urxvt -e "bash -i start-ncmpcpp.sh"
     urxvtc -g 84x20+414+61 -e ncmpcpp
  else
     # mpd is not running
	mpd
	urxvtc -g 84x20+414+61 -e ncmpcpp
fi
