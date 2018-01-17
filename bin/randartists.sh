#!/bin/sh

ls "$HOME/mnt/My Music/Music" | shuf -n $0 >! "$HOME/.cache/randartists" 

while read p; do
    cp -r "$HOME/mnt/My Music/Music/$p" "$HOME/music/Music/$p"
done <"$HOME/.cache/randartists"

