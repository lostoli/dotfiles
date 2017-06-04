STFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e

#If not running interactively, don't do anything
[[ $- != *i* ]] && return


# -- Variables
export EDITOR=nvim
export PATH=$HOME/bin:/usr/local/bin:$PATH
export BROWSER="firefox"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=background,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=background,fg=red,bold'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias restart='killall -SIGUSR1'
alias update='yaourt -Syua && sudo pkgcacheclean'
alias update-lightdm='sudo ~/bin/update-lightdm.sh'
alias sf='screenfetch -c 1,15'
alias vpn-e2-4='sudo openvpn ~/Manjaro/VPN/vpnbook/vpnbook-euro2-tcp443.ovpn'
alias vpn-e2-8='sudo openvpn ~/Manjaro/VPN/vpnbook/vpnbook-euro2-tcp80.ovpn'
alias vpn-u1-4='sudo openvpn ~/Manjaro/VPN/vpnbook/vpnbook-us1-tcp443.ovpn'
alias vpn-u1-8='sudo openvpn ~/Manjaro/VPN/vpnbook/vpnbook-us1-tcp80.ovpn'
alias vpn-e1-4='sudo openvpn ~/Manjaro/VPN/vpnbook/vpnbook-euro1-tcp443.ovpn'
alias r-Xres='xrdb ~/.Xresources'
alias mp='jmtpfs ~/mnt'
alias up='fusermount -u ~/mnt'
alias op='offlineimap -o'
alias colors='sh ~/bin/color.sh'
alias vbrc='$EDITOR ~/.config/bspwm/bspwmrc'
alias vzrc='$EDITOR ~/.zshrc'
alias vprc='$EDITOR ~/.config/polybar/config'
alias vsrc='$EDITOR ~/.config/sxhkd/sxhkdrc'
alias vvrc='$EDITOR ~/.config/$EDITOR/init.vim'
alias e=$EDITOR

function prepend(){
# @author Abdennour TOUMI
if [ -e $1 ]; then
    sed -i -e '1i$1\' $1
fi
}
function mkscript(){
    if [[ ! -a ~/bin/$1.sh ]]; then 
        touch ~/bin/$1.sh && echo "#!/bin/bash" >! ~/bin/$1.sh && chmod +x ~/bin/$1.sh && $EDITOR ~/bin/$1.sh
    else
        echo "Script allready exists!"
    fi
}
