#!/bin/bash

#check if cbatticon is running
if pgrep cbatticon >/dev/null 2>&1
  then
     # cbatticon is running
	pkill cbatticon
  else
     # cbatticon is not running
	cbatticon
fi