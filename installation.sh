#! /bin/bash

set -e

echo 'Installation script for macOS.'
echo 'Press enter to continue after each prompt.'
read -p 'Install Homebrew.' unused

echo 'Installing RipGrep...'
brew install ripgrep

echo 'Installing FZF...'
brew install fzf
$(brew --prefix)/opt/fzf/install
