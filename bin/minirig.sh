#!/bin/sh

if pacmd list-sinks | grep -q bluetooth; then 
    pacmd set-sink-mute bluez_sink.00_12_6F_AD_11_6D.a2dp_sink 1
    $HOME/bin/bt-off.sh | bluetoothctl
else 
    $HOME/bin/bt-on.sh | bluetoothctl
    pacmd set-sink-mute bluez_sink.00_12_6F_AD_11_6D.a2dp_sink 0
fi
# run the program bluez
