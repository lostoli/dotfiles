#!/bin/sh

U=$(checkupdates | wc -l)
I=$(cat /etc/pacman.conf | grep '^IgnorePkg' | wc -w)

N=$((($U - $I) + 0))

cat >~/.cache/updates <<EOL
$N
EOL
