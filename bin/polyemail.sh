#!/bin/sh   

colorm() {
    if [ "$1" -ge "5" ]; then
        echo %{F#$C11}$1%{F-}
        elif [ "$1" -ge "1" ]; then
        echo %{F#$C1}$1%{F-}
        else 
        echo "$1"
        fi
}

cd $HOME/stuff/python/pmail
# LO=$(ls /home/oli/Mail/lostoli/INBOX/new | wc -l)
# LO=$($HOME/stuff/python/pmail/pmailServer.py -n 'lostoli@gmail.com')
LO=$(python -m pmail -n LO)
# OG=$(ls /home/oli/Mail/o.g.sargent/INBOX/new | wc -l)
# OG=$($HOME/stuff/python/pmail/pmailServer.py -n "o.g.sargent@gmail.com")
OG=$(python -m pmail -n 'OG')
#OS=$(ls /home/oli/Mail/olivers2/INBOX/new | wc -l)

echo "%{F#$C7}Mail:%{F-} $(colorm $LO)|$(colorm $OG)"
