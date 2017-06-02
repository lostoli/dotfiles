#!/bin/sh

N=$(bspc query -D | wc -l)
if [ "$1" -eq "1" ]; then
    bspc monitor -a $(($N+1))
    echo "$(($N+1))"
else 
    bspc desktop ^"$N" -r
    echo "$N"
fi
