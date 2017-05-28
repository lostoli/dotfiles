# Path to your oh-my-zsh installation.
#export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(archlinux colored-man-pages)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

#source $ZSH/oh-my-zsh.sh

# source ~/Manjaro/Scripts/exportcolors.sh 

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mnvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
STFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e


# End of lines configured by zsh-newuser-install

#If not running interactively, don't do anything
[[ $- != *i* ]] && return


# -- Variables
export EDITOR=nvim
export BROWSER="firefox"


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
alias update='allservers'
alias update-lightdm='sudo ~/Manjaro/Scripts/update-lightdm.sh'
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
alias colors='sh ~/Manjaro/Scripts/color.sh'
alias vbrc='nvim ~/.config/bspwm/bspwmrc'
alias vzrc='nvim ~/.zshrc'
alias vprc='nvim ~/.config/polybar/config'
alias vsrc='nvim ~/.config/sxhkd/sxhkdrc'
alias vvrc='nvim ~/.config/nvim/init.vim'
alias e=$EDITOR

function prepend(){
# @author Abdennour TOUMI
if [ -e $1 ]; then
    sed -i -e '1i$1\' $1
fi
}
function mkscript(){
    if [[ ! -a ~/Manjaro/Scripts/$1.sh ]]; then 
        touch ~/Manjaro/Scripts/$1.sh && echo "#!/bin/bash" > ~/Manjaro/Scripts/$1.sh && chmod +x ~/Manjaro/Scripts/$1.sh && nvim ~/Manjaro/Scripts/$1.sh
    else
        echo "Script allready exists!"
    fi
}
