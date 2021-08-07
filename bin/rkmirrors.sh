#!/bin/sh

rankmirrors -n 6 /home/oli/.mirrorlist >! /etc/pacman.d/mirrorlist
