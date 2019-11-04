#! /bin/bash

set -e

echo 'Installation script for macOS.'
echo 'Press enter to continue after each prompt.'
read -p 'Install Homebrew.' unused

echo 'Installing fzf, ripgrep, stow, tldr'
brew install fzf ripgrep stow tldr

echo 'Setting up fzf...'
$(brew --prefix)/opt/fzf/install

read -p 'Run: which tmux || brew install tmux.' unused
