#!/bin/sh
cat >~/dotfiles/Startpage/_colors.scss <<EOL
\$colorf: #$Cf;
\$colorb: #$Cb;

\$color0: #$C0;
\$color8: #$C8;

\$color1: #$C1;
\$color9: #$C9;

\$color2: #$C2;
\$color10: #$C10;

\$color3: #$C3;
\$color11: #$C11;

\$color4: #$C4;
\$color12: #$C12;

\$color5: #$C5;
\$color13: #$C13;

\$color6: #$C6;
\$color14: #$C14;

\$color7: #$C7;
\$color15: #$C15;

EOL

sass ~/dotfiles/Startpage/style.scss ~/dotfiles/Startpage/style-test.css
sass ~/dotfiles/Startpage/clock-style.scss ~/dotfiles/Startpage/clock-style.css

cp $(grep -o 'pics.*' ~/.fehbg | rev | cut -c 3- | rev) ~/dotfiles/Startpage/bg.jpg
