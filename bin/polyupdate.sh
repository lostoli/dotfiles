#!/bin/bash

#✽
if [ "$(cat ~/.cache/updates)" -ge "1" ] ; then
    echo "%{F#$C3}%{F-}"
else
    echo "%{F#$C15}%{F-}"
fi
