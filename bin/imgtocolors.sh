#!/bin/sh
cache_file="$HOME/.cache/colors"
wal=$1
color_count=16

#if [[ -f "$cache_file" ]]; then
#    rm "$cache_file" 
#else
    colors=($(convert "${wal}"  +dither -colors $color_count -unique-colors txt:- | grep -E -o " \#.{6}"))

    # If imagemagick finds less than 16 colors, use a larger source number of colors.
    while (( "${#colors[@]}" <= 15 )); do
        colors=($(convert "${wal}"  +dither -colors "$((color_count + ${index:-2}))" -unique-colors txt:- | grep -E -o " \#.{6}"))
        ((index++))
        out "colors: Imagemagick couldn't generate a $color_count color palette, trying a larger palette size ($((color_count + index)))."

        # Quit the loop if we're taking too long.
        ((index == 10)) && break
    done

    # Cache the scheme.
#    printf "%s\n" "${colors[@]}" > "$cache_file"
#fi


#colors=($(< "$cache_file"))

wall=$(echo "$(basename $wal)" | cut -f 1 -d '.')
#echo $(basename $wal) | sed 's/\.[^ ]*/ /g')

if [[ -f "$HOME/.Xresources-colors/themes/$wall" ]]; then
    echo "colorscheme exists!" 
else
cat >"$HOME/.Xresources-colors/themes/$wall" <<EOL 
! special
*foreground:   ${colors[15]} 
*background:   ${colors[0]}
*cursorColor:  ${colors[13]} 

!black
*color0:       ${colors[0]}
*color8:       ${colors[8]}

!red
*color1:       ${colors[1]} 
*color9:       ${colors[9]}

!green
*color2:       ${colors[2]}
*color10:      ${colors[10]}

!yellow
*color3:       ${colors[3]}
*color11:      ${colors[11]}

!blue
*color4:       ${colors[4]}
*color12:      ${colors[12]}

!magenta
*color5:       ${colors[5]}
*color13:      ${colors[13]} 

!cyan
*color6:       ${colors[6]} 
*color14:      ${colors[14]} 

!white
*color7:       ${colors[7]} 
*color15:      ${colors[15]}
EOL
fi
