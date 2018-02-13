#!/bin/sh

get_price (){
    curl -s "https://api.coinmarketcap.com/v1/ticker/$1/" | tail -n +2 | sed '$d' | jq -r '.price_usd'
}

get_sym (){
    curl -s "https://api.coinmarketcap.com/v1/ticker/$1/" | tail -n +2 | sed '$d' | jq -r '.symbol'
}

get_pec (){
    curl -s "https://api.coinmarketcap.com/v1/ticker/$1/" | tail -n +2 | sed '$d' | jq -r '.percent_change_24h'
}

round() {
    n=$(printf "%.${1}g" "$2")
    if [ "$n" != "${n#*e}" ]
    then
        f="${n##*e-}"
        test "$n" = "$f" && f= || f=$[ $f+$1-1 ]
        printf "%0.${f}f" "$n"
    else
        printf "%s" "$n"
    fi
}

print (){
    echo "%{F#$C6}$(get_sym $1):%{F-} \$$(round  3 $(get_price $1))/$(get_pec $1)%"
}

N=$(cat ~/.cache/cryptocounter)
L=$(wc -l < ~/.cache/cryptos)
if (("$N" <= "$L")); then
    print $(head -"$N" ~/.cache/cryptos | tail -1) 2
    echo "$(("$N" +1))" > ~/.cache/cryptocounter
else
    print $(head -1 ~/.cache/cryptos | tail -1) 2
    echo 2 > ~/.cache/cryptocounter
fi

