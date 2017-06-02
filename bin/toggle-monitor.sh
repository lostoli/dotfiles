#!/bin/bash
intern=eDP1
extern=VGA1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    #xrandr --output "$intern" --off --output "$extern" --auto
    xrandr --output "$intern" --primary --auto --output "$extern" --right-of "$intern" --auto
fi
