#!/bin/zsh

for n ({0..15}); do export "C$n"="$(getxcolors.sh color$n)"; done
export Cb="$(getxcolors.sh background)"
export Cf="$(getxcolors.sh foreground)"

