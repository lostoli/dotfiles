#!/bin/sh

if [ "$(cat ~/.cache/updates)" -ge "1" ] ; then
    E1="%{F#$C11}%{F-}"
else
    E1=" "
    #E1=$E0"%{F#$Cf}%{F-}"
fi

if cat /proc/acpi/ibm/bluetooth | grep -q enabled; then
    E2=" %{F#$C6}%{F-}"
else
    E2=" "
    #E2=$E1" %{F#$Cf}%{F-}"
fi


#if ping -q -w 1 -c 1 8.8.8.8 > /dev/null; then
#if rfkill list wlan | grep -q 'Soft blocked: no'; then
    #if ip route get 8.8.8.8 | grep -q wlan0; then
if cat /sys/class/net/wlan0/carrier > /dev/null 2>&1; then
    E3=" %{F#$C6}%{F-}"
elif cat /sys/class/net/eth0/carrier > /dev/null 2>&1; then
    #ip route get 8.8.8.8 | grep -q eth0; then
    E3=" %{F#$C6}%{F-}"
else
    E3=" %{F#$C9}%{F-}"
fi

if [ "$(pgrep -c mopidy)" -ge 1 ]; then 
        E4=" %{F#$C6}%{F-}"
    else
        E4=" "
fi

echo $E1$E3$E2$E4
