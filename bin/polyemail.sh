#!/bin/sh   

colorm() {
    if [ "$1" -ge "5" ]; then
        echo %{F#$C11}$1%{F-}
        elif [ "$1" -ge "1" ]; then
        echo %{F#$C9}$1%{F-}
        else 
        echo "$1"
        fi
}

LO=$(ls /home/oli/Mail/lostoli/INBOX/new | wc -l)
OG=$(ls /home/oli/Mail/o.g.sargent/INBOX/new | wc -l)
#OS=$(ls /home/oli/Mail/olivers2/INBOX/new | wc -l)

echo "%{F#$C8}Mail:%{F-} $(colorm $LO)|$(colorm $OG)"
