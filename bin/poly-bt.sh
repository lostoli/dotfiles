#!/bin/sh

if cat /proc/acpi/ibm/bluetooth | grep -q enabled; then
    echo "%{F#$C11}"
else 
    echo "%{F#$Cb}"
fi
