#!/bin/sh

get_price (){
    curl -s "https://api.coinmarketcap.com/v1/ticker/$1/" | tail -n +2 | sed '$d' | jq -r '.price_usd'
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

if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then

    BTC=$(get_price bitcoin)
    ETH=$(get_price ethereum)
    IOT=$(get_price iota)
    RIP=$(get_price ripple)
    OMG=$(get_price omisego)
    ARK=$(get_price ark)
    KNC=$(get_price kyber-network)
    BAT=$(get_price basic-attention-token)
    PAY=$(get_price tenx)
    LINK=$(get_price chainlink)
    EVX=$(get_price everex)
    SUB=$(get_price substratum)
    NAV=$(get_price nav-coin)
    ADA=$(get_price cardano)
    XMR=$(get_price monero)
    LTC=$(get_price litecoin)
    ZRX=$(get_price 0x)
    ICX=$(get_price icon)
    CRED=$(get_price verify)
    REQ=$(get_price request-network)
    PRL=$(get_price oyster)
    ELF=$(get_price aelf)
    SPK=$(get_price spankchain)

    #TOT=$(bc <<< 0.125*$BTC+19.3*$ETH+520*$IOT+1000*$RIP+25*$OMG+57*$ARK)

    TOT1=$(bc <<< 7.95*$XMR+19.3*$ETH+520*$IOT+1000*$RIP+25*$OMG+57*$ARK+750*$ICX)

    TOT2=$(bc <<< 8.34*$LTC+347*$NAV+19168*$ADA+7.36*$ETH+50*$OMG+213*$ARK+557*$KNC+1690*$BAT+306*$PAY+2209*$LINK+320*$EVX+3288*$SUB+1635*$ZRX+2600*$REQ+573*$CRED+2470*$SPK+392*$PRL+400*$ELF)

    #TOTT=$(bc <<< 0.25*$(get_price bitcoin)+24.82*$(get_price ethereum)+75*$(get_price omisego)+207*$(get_price ark)+257*$(get_price kyber-network)+500*$(get_price basic-attention-token)+237*$(get_price tenx)+520*$(get_price iota)+1000*$(get_price ripple)+350*$(get_price chainlink))
    TOTT=$(bc <<< $TOT1+$TOT2)
    #rTOT=$(echo "scale=0; $TOT/1" | bc)
    rTOT1=$(round 3 $TOT1)
    rTOT2=$(round 3 $TOT2)
    rTOTT=$(round 3 $TOTT)
    T1=$(date +%s) 
    TIME=$(echo "$T1 - 1504417366" | bc)

    echo -e "$TIME\t$rTOT1" >> ~/stuff/crypto.dat 
    echo -e "$TIME\t$rTOT2" >> ~/stuff/crypto-new.dat 
    echo -e "$TIME\t$rTOTT" >> ~/stuff/crypto-tot.dat 

    H=105000
    L=19000
    if [ "$rTOTT" -gt "$H" ]
    then
        echo "Currently your cryptocurrency is worth \$$TOTT :)" | mutt -s "Alert" lostoli@gmail.com
    elif [ "$rTOTT" -lt "$L" ]
    then
        echo "Currently your cryptocurrency is worth \$$TOTT :(" | mutt -s "Alert" lostoli@gmail.com
    fi 

fi
