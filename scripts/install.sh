#!/usr/bin/env bash

set -euo pipefail

echo "==> Installing external tools"

# Check required dependencies
for cmd in curl bash; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: '$cmd' is required but not installed."
        exit 1
    fi
done

# Oh My Posh
if command -v oh-my-posh >/dev/null 2>&1; then
    echo "✓ Oh My Posh is already installed."
else
    echo "→ Installing Oh My Posh..."
    curl -fsSL https://ohmyposh.dev/install.sh | bash
fi

# zoxide
if command -v zoxide >/dev/null 2>&1; then
    echo "✓ zoxide is already installed."
else
    echo "→ Installing zoxide..."
    curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

echo
echo "==> Verifying installation"

for cmd in oh-my-posh zoxide; do
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "✓ $cmd"
    else
        echo "Warning: '$cmd' was installed but is not currently in PATH."
    fi
done

echo
echo "Done."