#! /bin/bash

set -e

echo 'Installation script for macOS.'
echo 'Press enter to continue after each prompt.'
read -p 'Install Homebrew.' unused

echo 'Installing useful utilities.'
brew install fzf htop ripgrep stow tldr tmux tree

echo 'Setting up fzf...'
$(brew --prefix)/opt/fzf/install

read -p 'Install symlinks using stow.' unused
