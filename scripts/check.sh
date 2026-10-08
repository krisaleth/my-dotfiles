#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "==> Checking dotfiles"

echo "→ Bash syntax"
bash -n "$DOTFILES/bash/.bashrc"
bash -n "$DOTFILES/scripts/install.sh"
bash -n "$DOTFILES/scripts/setup.sh"

echo "✓ Bash syntax"

echo "→ Zsh syntax"
zsh -n "$DOTFILES/zsh/.zshrc"

echo "✓ Zsh syntax"

echo "→ Git config"
git config --file "$DOTFILES/git/.gitconfig" --list >/dev/null

echo "✓ Git config"

echo "→ Git whitespace"
git -C "$DOTFILES" diff --check

echo "✓ Git whitespace"

if command -v pwsh >/dev/null 2>&1; then
    echo "→ PowerShell syntax"
    pwsh -NoProfile -Command \
        "& { \$null = [System.Management.Automation.Language.Parser]::ParseFile(
            '$DOTFILES/scripts/setup.ps1',cd
            [ref]\$null,
            [ref]\$null
        ) }"

    echo "✓ PowerShell syntax"
else
    echo "⚠ PowerShell (pwsh) not found, skipping"
fi

echo
echo "==> All checks passed."