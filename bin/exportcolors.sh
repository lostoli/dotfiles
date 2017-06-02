#!/bin/sh

for n in {0..15}; do 
export "C$n"="$(sh ~/bin/getxcolors.sh color$n)"
done
export Cb="$(sh ~/bin/getxcolors.sh background)"
export Cf="$(sh ~/bin/getxcolors.sh foreground)"

