#!/bin/bash
N=$(cat ~/.cache/colorcounter)
if (("$N" < "15")); then
    echo "%{F$(sh ~/bin/getxcolors.sh color$N)}%{F$(sh ~/bin/getxcolors.sh foreground)}"
    echo "$(("$N" +1))" > ~/.cache/colorcounter
else
    echo "%{F$color[15]}"
    echo 0 > ~/.cache/colorcounter
fi
