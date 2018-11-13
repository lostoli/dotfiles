#!/bin/sh

S=$(cat ~/.cache/dmenustate)

if [ "$S" -eq "1" ]; then
#dmenu_run -h 19 -fn "-*-tamsyn-medium-*-*-*-15-*-*-*-*-*-*-*" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0"
#dmenu_run -lh 17 -fn "Iosevka Term-9" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0"
dmenu -p "$1" -lh 17 -fn "Roboto Mono Medium For Powerline-9" -nb "#$Cb" -nf "#$Cb" -sb "#$C9" -sf "#$C0" <&-
else
#dmenu_run -h 18 -x 12 -y 7 -w 1344 -fn "-*-tamsyn-medium-*-*-*-15-*-*-*-*-*-*-*" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0" 
#dmenu_run -lh 18 -x 12 -y 7 -w 1344 -fn "Iosevka Term-9" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0" 
dmenu -p "$1" -lh 18 -x 12 -y 7 -w 1344 -fn "Roboto Mono Medium For Powerline-9" -nb "#$Cb" -nf "#$Cb" -sb "#$C9" -sf "#$C0" <&-
fi
# dmenu -p "$1" -fn "$font" 
