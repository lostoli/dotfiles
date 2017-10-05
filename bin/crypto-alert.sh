#!/bin/sh

BTC=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
ETH=$(curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
IOT=$(curl -s https://api.coinmarketcap.com/v1/ticker/iota/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
RIP=$(curl -s https://api.coinmarketcap.com/v1/ticker/ripple/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
OMG=$(curl -s https://api.coinmarketcap.com/v1/ticker/omisego/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
ARK=$(curl -s https://api.coinmarketcap.com/v1/ticker/ark/ | tail -n +2 | sed '$d' | jq -r '.price_usd')

TOT=$(bc <<< 0.125*$BTC+19.3*$ETH+520*$IOT+1000*$RIP+25*$OMG+57*$ARK)
rTOT=$(echo "scale=0; $TOT/1" | bc)
T1=$(date +%s) 
TIME=$(echo "$T1 - 1504417366" | bc)

echo -e "$TIME\t$rTOT" >> ~/stuff/crypto.dat 

H=12000
L=4000
if [ "$rTOT" -gt "$H" ]
then
    echo "Currently your cryptocurrency is worth \$$TOT :)" | mutt -s "Alert" lostoli@gmail.com
elif [ "$rTOT" -lt "$L" ]
then
    echo "Currently your cryptocurrency is worth \$$TOT :(" | mutt -s "Alert" lostoli@gmail.com
fi 
