#!/bin/bash

# set up the two monitors for bspwm
# NOTE This is a simplistic approach because I already know the settings I
# want to apply.
external_monitor=$(xrandr --query | grep 'HDMI2')
if [[ $external_monitor = *connected* ]]; then
    xrandr --output HDMI2 --mode 3840x2160 --primary --output eDP1 --mode 1366x768 --left-of HDMI2
fi
