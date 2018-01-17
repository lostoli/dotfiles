#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

function echoerr {
    echo "$@" 1>&2
}

function trycreatedir {
    if [ ! -d "$1" ]; then
        echo "Creating directory $1..."
        mkdir "$1" 1>/dev/null 2>/dev/null || echoerr "Failed to create directory $1"
    fi
}

function trysymlink {
    echo "Linking $1 to $2..."
    if [ ! -e $2 ]; then
        ln -s "$1" "$2" 1>/dev/null 2>/dev/null || echoerr "Failed to create link from $1 to $2"
    else
        echoerr "$2 already exists, not linking"
    fi
}

trysymlink "$DOTFILES_DIR/bin" "$HOME/bin"
trysymlink "$DOTFILES_DIR/Xresources-colors" "$HOME/.Xresources-colors/"
trysymlink "$DOTFILES_DIR/pentadactyle" "$HOME/.pentadactyle/"
trysymlink "$DOTFILES_DIR/ncmpcpp" "$HOME/.ncmpcpp"
trysymlink "$DOTFILES_DIR/config/nvim" "$HOME/.config/nvim"
trysymlink "$DOTFILES_DIR/config/mpd" "$HOME/.config/mpd"
trysymlink "$DOTFILES_DIR/config/bspwm" "$HOME/.config/bspwm"
trysymlink "$DOTFILES_DIR/config/ranger" "$HOME/.config/ranger"
trysymlink "$DOTFILES_DIR/config/sxhkd" "$HOME/.config/sxhkd"
trysymlink "$DOTFILES_DIR/config/zathura" "$HOME/.config/zathura"
trysymlink "$DOTFILES_DIR/config/polybar" "$HOME/.config/polybar"
trysymlink "$DOTFILES_DIR/latexmkrc" "$HOME/.latexmkrc"
trysymlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
trysymlink "$DOTFILES_DIR/zimrc" "$HOME/.zimrc"
trysymlink "$DOTFILES_DIR/zlogin" "$HOME/.zlogin"
trysymlink "$DOTFILES_DIR/rtorrent.rc" "$HOME/.rtorrent.rc"
trysymlink "$DOTFILES_DIR/pentadactylrc" "$HOME/.pentadactylrc"
trysymlink "$DOTFILES_DIR/Xresources" "$HOME/.Xresources"

unset DOTFILES_DIR
