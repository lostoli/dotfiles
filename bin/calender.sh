#!/bin/bash

#check if orage is running
if pgrep orage >/dev/null 2>&1
  then
     # orage is running
	pkill orage
  else
     # orage is not running
	orage
fi