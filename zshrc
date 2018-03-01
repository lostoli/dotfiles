#
# User configuration sourced by interactive shells
#

# Change default zim location 
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Source zim
if [[ -s ${ZIM_HOME}/init.zsh ]]; then
  source ${ZIM_HOME}/init.zsh
fi
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

#:::::testing
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
prompt_minimal_path() {
  local path_color='%F{yellow}'
  print -n "${path_color}${$(short_pwd)//\//%f\/${path_color}}%f"
}
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% n]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(prompt_minimal_path)$(prompt_minimal_git) $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
#::::end test


bindkey "^[[3~" delete-char
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line


#make delete home and end work
bindkey    "^[[3~"          delete-char
bindkey  "^[[7~"   beginning-of-line
bindkey  "^[[8~"   end-of-line

#If not running interactively, don't do anything
[[ $- != *i* ]] && return


# -- Variables
export EDITOR=nvim
export PATH=$HOME/bin:/usr/local/bin:$PATH
export BROWSER="firefox"
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=background,fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=background,fg=red,bold'


## history substring
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
##

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
alias update='yay -Syu && sudo paccache -r -k 2 && update.sh'
alias update-lightdm='sudo ~/bin/update-lightdm.sh'
alias sf='screenfetch -c 1,15'
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
alias se='sudo $EDITOR'
alias mx='rmaxima'
alias :q='exit'
alias www='sudo systemctl restart wpa_supplicant.service && sudo systemctl restart connman.service && connmanctl'
alias pow='sudo tlp stat'
alias charge='sudo tlp fullcharge BAT1 && sudo tlp fullcharge BAT0'
alias blue='sudo systemctl restart bluetooth.service && bin/minirig.sh'

function prepend(){
# @author Abdennour TOUMI
if [ -e $1 ]; then
    sed -i -e '1i$1\' $1
fi
}

function mkscript(){
    if [[ ! -a ~/bin/$1.sh ]]; then 
        touch ~/bin/$1.sh && echo "#!/bin/sh" >! ~/bin/$1.sh && chmod +x ~/bin/$1.sh && $EDITOR ~/bin/$1.sh
    else
        echo "Script allready exists!"
    fi
}

function mm() {
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"$@"
}

function mult(){
    echo $(($1*$2))
}

function div(){
    echo $(($1/$2))
}

nplayer () (nc -kluw 1 127.0.0.1 5555 > /tmp/mpd.fifo & trap "kill $!" EXIT; ncmpcpp -c $HOME/.ncmpcpp/config-mopidy)
