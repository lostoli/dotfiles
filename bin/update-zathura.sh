#!/bin/sh

cat >~/.config/zathura/zathurarc <<EOL
set show-scrollbars false
set adjust-open width
#set window-height 600
#set window-width 850
set font                        "inconsolata 9"

set completion-bg               "#$C2"
set completion-fg               "#$C0"

set completion-group-bg         "#$C0"
set completion-group-fg         "#$C8"

set completion-highlight-fg     "#$C2"
set completion-highlight-bg     "#$C8"

set default-bg                  "#$Cb"
set default-fg                  "#$Cf"

set inputbar-bg                 "#$Cb" 
set inputbar-fg                 "#$C2"

set statusbar-bg                "#$C2"
set statusbar-fg                "#$Cb"

set notification-error-bg       "#$C0"
set notification-error-fg       "#$C2" 

set notification-warning-bg     "#$C0"
set notification-warning-fg     "#$C2"

set highlight-color             "#$C14"
set highlight-active-color      "#$C7"

set notification-bg             "#$C0"
set notification-fg             "#$C2"

set index-bg                    "#$C2"
set index-fg                    "#$C13"

set index-active-bg             "#$C2"
set index-active-fg             "#$C0"

set recolor-lightcolor          "#$Cb"
set recolor-darkcolor           "#$Cf"

set recolor                     "true"
set recolor-keephue             "false"
set recolor-reverse-video       "true"
set scroll-hstep 9

EOL
