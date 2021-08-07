#!/bin/sh

cat >~/.config/zathura/zathurarc <<EOL
set show-scrollbars false
# set adjust-open width
#set window-height 600
#set window-width 850
set font                        "inconsolata 9"

set completion-bg               "#$C3"
set completion-fg               "#$C0"

set completion-group-bg         "#$C0"
set completion-group-fg         "#$C8"

set completion-highlight-fg     "#$C3"
set completion-highlight-bg     "#$C8"

set default-bg                  "#$Cb"
set default-fg                  "#$Cf"

set inputbar-bg                 "#$Cb" 
set inputbar-fg                 "#$C3"

set statusbar-bg                "#$C3"
set statusbar-fg                "#$Cb"

set notification-error-bg       "#$C0"
set notification-error-fg       "#$C3" 

set notification-warning-bg     "#$C0"
set notification-warning-fg     "#$C3"

set highlight-color             "#$C14"
set highlight-active-color      "#$C7"

set notification-bg             "#$C0"
set notification-fg             "#$C3"

set index-bg                    "#$C3"
set index-fg                    "#$Cb"

set index-active-bg             "#$Cb"
set index-active-fg             "#$C3"

set recolor-lightcolor          "#$Cb"
set recolor-darkcolor           "#$Cf"

set recolor                     "true"
set recolor-keephue             "true"
set recolor-reverse-video       "true"
set scroll-hstep 9

EOL
