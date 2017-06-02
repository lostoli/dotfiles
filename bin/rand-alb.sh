#!/bin/sh

mpc search album "$(mpc list album | shuf -n1)" | mpc add