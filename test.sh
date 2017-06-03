#!/bin/bash

find -type d | sed -e '/.git\|bin/d' | sed -e '1d' | sed -e 's .\{2\}  ' | less
