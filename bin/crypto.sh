#!/bin/sh

BTC=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
ETH=$(curl -s https://api.coinmarketcap.com/v1/ticker/ethereum/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
IOT=$(curl -s https://api.coinmarketcap.com/v1/ticker/iota/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
RIP=$(curl -s https://api.coinmarketcap.com/v1/ticker/ripple/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
OMG=$(curl -s https://api.coinmarketcap.com/v1/ticker/omisego/ | tail -n +2 | sed '$d' | jq -r '.price_usd')
ARK=$(curl -s https://api.coinmarketcap.com/v1/ticker/ark/ | tail -n +2 | sed '$d' | jq -r '.price_usd')

rBTC=$(echo "scale=0; $BTC/1" | bc)
rETH=$(echo "scale=0; $ETH/1" | bc)
rOMG=$(echo "scale=1; $OMG/1" | bc)
rARK=$(echo "scale=2; $ARK/1" | bc)
rIOT=$(echo "scale=2; $IOT/1" | bc)
rRIP=$(echo "scale=2; $RIP/1" | bc)

echo "$rBTC|$rETH|$rOMG|$rARK|0$rIOT|0$rRIP"
#TOT=$(bc <<< 0.4*$BTC+19.3*$ETH+470*$IOT)
#echo "$TOT"
