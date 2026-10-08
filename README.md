# Dotfiles

Personal dotfiles for a lightweight Windows + WSL2 development environment.

## Features

* Zsh as the primary WSL shell
* Bash compatibility
* PowerShell 7 configuration
* Oh My Posh prompt
* zoxide
* fzf
* eza and bat
* Git configuration and aliases
* Windows Terminal configuration
* Idempotent setup scripts

## Requirements

### WSL2

* Ubuntu 24.04 or compatible Debian-based distribution
* `curl`
* `bash`
* `git`
* `zsh`

### Windows

* Windows Terminal
* PowerShell 7
* Oh My Posh
* MesloLGL Nerd Font

## Installation

Clone the repository:

```
git clone https://github.com/krisaleth/my-dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### WSL2

Install the required APT packages:

```
sudo apt install $(cat packages/apt.txt)
```

Install external tools:

```
./scripts/install.sh
```

Setup the dotfiles:

```
./scripts/setup.sh
```

The setup script creates symlinks for Bash and Zsh configuration and configures Git to include the repository's Git configuration.

### Windows

Open PowerShell and run:

```
.\scripts\setup.ps1
```

The script creates a symlink from the PowerShell profile to the repository.

Windows Terminal settings are stored in:

```
windows-terminal/
```

They include the PowerShell and WSL profiles, Tokyo Night color scheme, MesloLGL Nerd Font, and custom keybindings.

## Shell Configuration

### Zsh

Configuration:

```
zsh/.zshrc
```

Aliases:

```
zsh/.zsh_aliases
```

Features include:

* Native command completion
* History search
* fzf keybindings
* zoxide
* Oh My Posh

### Bash

Configuration:

```
bash/.bashrc
```

Aliases:

```
bash/.bash_aliases
```

Bash is kept as a compatibility shell while Zsh is the primary interactive shell.

### PowerShell

Configuration:

```
powershell/Microsoft.PowerShell_profile.ps1
```

Features include:

* PSReadLine history predictions
* Windows editing mode
* Terminal-Icons
* Oh My Posh

## Git

Git configuration:

```
git/.gitconfig
```

Includes:

* Git aliases
* `push.autoSetupRemote`
* `fetch.prune`
* `pull.rebase`
* VS Code as the Git editor

User identity and credentials are kept in the local Git configuration and are not stored in this repository.

## Validation

Run the repository checks with:

```
./scripts/check.sh
```

The validation script checks:

* Bash syntax
* Zsh syntax
* Git configuration
* Git whitespace
* PowerShell syntax when `pwsh` is available

## Structure

```
dotfiles/
├── bash/              # Bash configuration
├── git/               # Git configuration
├── oh-my-posh/        # Oh My Posh theme
├── packages/          # APT package list
├── powershell/        # PowerShell profile
├── scripts/           # Installation and setup scripts
├── windows-terminal/  # Windows Terminal settings
└── zsh/               # Zsh configuration
```

## Philosophy

Keep the environment:

* Lightweight
* Reproducible
* Cross-platform where practical
* Easy to understand
* Free from unnecessary plugins and frameworks
