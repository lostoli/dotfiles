#!/bin/sh

## ls "$HOME/mnt1/My Music/Music" | shuf -n $0 >! "$HOME/.cache/randartists" 

while read p; do
    cp -rn "$HOME/mnt1/My Music/Music/$p" "$HOME/music/Music/$p"
done <"$HOME/.cache/randartists"

