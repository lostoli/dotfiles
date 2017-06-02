#!/bin/sh

sed -i 3d ~/bin/dmenu_col.sh && sed -i -e '3iCb='"$Cb"'\' ~/bin/dmenu_col.sh
sed -i 4d ~/bin/dmenu_col.sh && sed -i -e '4iCf='"$Cf"'\' ~/bin/dmenu_col.sh
sed -i 5d ~/bin/dmenu_col.sh && sed -i -e '5iC1='"$C4"'\' ~/bin/dmenu_col.sh
sed -i 6d ~/bin/dmenu_col.sh && sed -i -e '6iC2='"$C1"'\' ~/bin/dmenu_col.sh
