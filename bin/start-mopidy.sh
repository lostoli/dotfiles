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

if ! pgrep -f .local/bin/bum >/dev/null 2>&1; then
    $HOME/.local/bin/bum --size "360" &
fi

if pgrep mopidy >/dev/null 2>&1
  then
     urxvtc -g 84x$H+414+61 -e ncmpcpp
else
    mopidy & 
    urxvtc -g 84x$H+414+61 -e ncmpcpp
fi
#mopidy && ~/.local/bin/bum && ncmpcpp
