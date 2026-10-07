# Dotfiles

Windows + WSL2 development environment.

## WSL2

Install APT packages:

sudo apt install $(cat packages/apt.txt)

Install user-local tools:

./scripts/install.sh

## Git

Git configuration is loaded from:
~/dotfiles/git/.gitconfig

## Shell

Bash config:
~/dotfiles/bash/.bashrc

PowerShell config:
~/dotfiles/powershell/Microsoft.PowerShell_profile.ps1