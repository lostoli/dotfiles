#!/bin/bash

U=$(yaourt -Qua | wc -l)
I=$(cat /etc/pacman.conf | grep '^IgnorePkg' | wc -w)

N=$((($U - $I) + 0))

echo $N
