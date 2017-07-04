#!/bin/sh
# end a command with ; to run in a terminal

SB="#$C9"
SF="#$C0"
NB="#$Cb"
NF="#$Cf"
OPTIONS1="-lh 19 -nb $NB -nf $NF -sb $SB -sf $SF"
OPTIONS2="-lh 18 -x 12 -y 7 -w 1344 -nb $NB -nf $NF -sb $SB -sf $SF"
STATE=$(cat ~/.cache/dmenustate)

if [ "$STATE" -eq "1" ]; then
DMENU="dmenu -i $OPTIONS1"
else
DMENU="dmenu -i $OPTIONS2"
fi
TERMI="urxvtc -e"
CACHE="$HOME/.dmenu_cache_recent"

touch $CACHE
MOST_USED=`sort $CACHE | uniq -c | sort -r | colrm 1 8`
RUN=`(echo "$MOST_USED"; dmenu_path | grep -vxF "$MOST_USED") | $DMENU $@` &&
(echo $RUN; head -n 99 $CACHE) > $CACHE.$$ &&
mv $CACHE.$$ $CACHE

case $RUN in
    *\;) exec `echo $TERMI $RUN | sed -e 's/;$//'`;;
    *)   exec $RUN;;
esac
