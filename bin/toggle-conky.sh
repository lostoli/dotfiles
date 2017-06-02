#!/bin/bash

#check if cbatticon is running
if pgrep conky >/dev/null 2>&1
  then
     # cbatticon is running
	killall conky
  else
     # cbatticon is not running
	conky
fi
