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

trycreatedir "$HOME/bin"
trycreatedir "$HOME/.Xresources-colors"

trysymlink "$DOTFILES_DIR/bin" "$HOME/bin"
trysymlink "$DOTFILES_DIR/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
trysymlink "$DOTFILES_DIR/config/polybar/config" "$HOME/.config/polybar/config"
trysymlink "$DOTFILES_DIR/Xresources-colors/colors" "$HOME/.Xresources-colors/colors"
trysymlink "$DOTFILES_DIR/Xresources-colors/themes" "$HOME/.Xresources-colors/themes"
trysymlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
trysymlink "$DOTFILES_DIR/zimrc" "$HOME/.zimrc"
trysymlink "$DOTFILES_DIR/rtorrent.rc" "$HOME/.rtorrent.rc"
trysymlink "$DOTFILES_DIR/Xresources" "$HOME/.Xresources"
trysymlink "$DOTFILES_DIR/pentadactylrc" "$HOME/.pentadactylrc"

unset DOTFILES_DIR
