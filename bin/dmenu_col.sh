#!/bin/bash

S=$(cat ~/.cache/dmenustate)

if [ "$S" -eq "1" ]; then
dmenu_run -h 19 -fn "-*-tamsyn-medium-*-*-*-15-*-*-*-*-*-*-*" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0"
else
dmenu_run -h 19 -x 11 -y 8 -w 1343 -fn "-*-tamsyn-medium-*-*-*-15-*-*-*-*-*-*-*" -nb "#$Cb" -nf "#$Cf" -sb "#$C9" -sf "#$C0" 
fi
