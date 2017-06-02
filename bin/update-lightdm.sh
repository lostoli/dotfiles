#!/bin/sh

sass /home/oli/stuff/Startpage/style.scss /usr/share/lightdm-webkit/themes/kiss/style.css

cp $(grep -o '/home.*' /home/oli/.fehbg | rev | cut -c 3- | rev) /usr/share/lightdm-webkit/themes/kiss/bg.jpg
