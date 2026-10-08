# Dotfiles

Windows + WSL2 development environment.

## Installation

Clone the repository:

```bash
git clone https://github.com/krisaleth/my-dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## WSL2

Install APT packages:

```bash
sudo apt install $(cat packages/apt.txt)
```

Install user-local tools:

```bash
./scripts/install.sh
```

Setup dotfiles:

```bash
./scripts/setup.sh
```

This configures:

* Bash
* Zsh
* Git
* Bash and Zsh aliases
* Oh My Posh
* zoxide
* fzf

Zsh is used as the primary interactive shell. Bash configuration is kept for compatibility.

## Windows

Run PowerShell as your normal user and execute:

```powershell
.\scripts\setup.ps1
```

This links the PowerShell profile to the dotfiles repository.

## Git

Git configuration is loaded from:

```text
~/dotfiles/git/.gitconfig
```

The configuration includes:

* Git aliases
* `push.autoSetupRemote`
* `fetch.prune`
* `pull.rebase`

User identity is configured separately in the local `~/.gitconfig` and is not stored in this repository.

## Shell

### Zsh

Zsh configuration:

```text
~/dotfiles/zsh/.zshrc
```

Aliases:

```text
~/dotfiles/zsh/.zsh_aliases
```

Features:

* Native command completion
* History search
* fzf history search with `Ctrl+R`
* zoxide
* Oh My Posh

### Bash

Bash configuration:

```text
~/dotfiles/bash/.bashrc
```

Aliases:

```text
~/dotfiles/bash/.bash_aliases
```

### PowerShell

PowerShell configuration:

```text
~/dotfiles/powershell/Microsoft.PowerShell_profile.ps1
```

## Structure

```text
dotfiles/
├── bash/              # Bash configuration
├── git/               # Git configuration
├── oh-my-posh/        # Oh My Posh theme
├── packages/          # APT package list
├── powershell/        # PowerShell profile
├── scripts/            # Installation and setup scripts
├── windows-terminal/  # Windows Terminal settings
└── zsh/               # Zsh configuration
```
