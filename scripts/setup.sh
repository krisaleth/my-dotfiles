#!/usr/bin/env bash

set -e

DOTFILES="/mnt/c/Users/Kris/dotfiles"

echo "Setting up dotfiles..."

link_file() {
    local source="$1"
    local target="$2"

    if [ ! -e "$source" ]; then
        echo "ERROR: source not found: $source"
        exit 1
    fi

    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        mv "$target" "$target.backup"
        echo "Backup: $target -> $target.backup"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target"
}

# Bash
link_file "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES/bash/.bash_aliases" "$HOME/.bash_aliases"

echo
echo "Dotfiles setup complete."
