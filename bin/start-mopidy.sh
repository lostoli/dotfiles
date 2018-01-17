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
      killall mpd
fi

#check mopidy
if pgrep mopidy >/dev/null 2>&1
  then
     urxvtc -g 84x$H+414+61 -e ncmpcpp
  else
    mopidy &
    sh ~/.local/bin/bum
    urxvtc -g 84x$H+414+61 -e ncmpcpp
fi
#mopidy && ~/.local/bin/bum && ncmpcpp
