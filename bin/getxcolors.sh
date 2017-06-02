#!/bin/bash

cat $(cat .Xresources | grep "#include" | tr -d \" | cut -c 10-) | grep -w "$1" | grep -o '#.*' | tr -d '#' 

