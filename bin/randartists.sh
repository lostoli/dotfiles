#!/bin/sh

while read p; do
    cp -rn "/media/Seagate Expansion Dr/My Music/Music/$p" "$HOME/music/Music/$p"
done <"$HOME/.cache/randartists"

