#!/bin/sh

b0Now=$(cat /sys/class/power_supply/BAT0/energy_now)
b0Full=$(cat /sys/class/power_supply/BAT0/energy_full)
b1Now=$(cat /sys/class/power_supply/BAT1/energy_now)
b1Full=$(cat /sys/class/power_supply/BAT1/energy_full)

b0Ch=$(echo "scale = 2; $b0Now/$b0Full" | bc)
b1Ch=$(echo "scale = 2; $b1Now/$b1Full" | bc)

b=$(echo "scale = 0; ($b0Ch+$b1Ch)*50/1" | bc)

echo $b
