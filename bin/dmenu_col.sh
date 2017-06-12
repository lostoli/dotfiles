#!/bin/bash

S=$(cat ~/.cache/dmenustate)

if [ "$S" -eq "1" ]; then
#dmenu_run -h 19 -fn "-*-tamsyn-medium-*-*-*-15-*-*-*-*-*-*-*" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0"
dmenu_run -h 19 -fn "Iosevka Term-9" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0"
else
#dmenu_run -h 18 -x 12 -y 7 -w 1344 -fn "-*-tamsyn-medium-*-*-*-15-*-*-*-*-*-*-*" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0" 
dmenu_run -h 18 -x 12 -y 7 -w 1344 -fn "Iosevka Term-9" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0" 
fi
