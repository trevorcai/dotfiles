#! /bin/bash

set -e

echo 'Installation script for macOS.'
echo 'Press enter to continue after each prompt.'
read -p 'Install Homebrew.' unused

echo 'Installing useful utilities.'
brew install bat exa fd fzf htop ripgrep stow tldr tmux tree

echo 'Setting up fzf...'
$(brew --prefix)/opt/fzf/install

echo 'Installing some symlinks using stow...'
stow --target=$HOME git tmux vim zsh

read -p 'Install VSCode & symlink settings.json in.' unused
