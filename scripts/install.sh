#!/usr/bin/env bash

set -e

echo "Installing Oh My Posh..."
curl -s https://ohmyposh.dev/install.sh | bash -s

echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo "Done."