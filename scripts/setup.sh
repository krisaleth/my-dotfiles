#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Setting up dotfiles"

link_file() {
    local source="$1"
    local target="$2"
    local backup="${target}.backup"

    if [[ ! -e "$source" ]]; then
        echo "ERROR: source not found: $source"
        exit 1
    fi

    # Already linked correctly
    if [[ -L "$target" ]] && [[ "$(readlink -f "$target")" == "$(readlink -f "$source")" ]]; then
        echo "✓ Already linked: $target"
        return
    fi

    # Remove existing symlink
    if [[ -L "$target" ]]; then
        rm "$target"
        echo "Removed existing symlink: $target"

    # Backup existing regular file/directory
    elif [[ -e "$target" ]]; then
        if [[ -e "$backup" ]]; then
            echo "ERROR: backup already exists: $backup"
            echo "Please remove or rename it before running setup again."
            exit 1
        fi

        mv "$target" "$backup"
        echo "Backup: $target -> $backup"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target"
}

# Bash
link_file "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES/bash/.bash_aliases" "$HOME/.bash_aliases"

# Zsh
link_file "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/zsh/.zsh_aliases" "$HOME/.zsh_aliases"

# Git
git config --global include.path "$DOTFILES/git/.gitconfig"
echo "✓ Configured Git: $DOTFILES/git/.gitconfig"

echo
echo "==> Dotfiles setup complete."