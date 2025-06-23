#! /bin/bash

set -e

echo 'Installation script for macOS.'
echo 'Press enter to continue after each prompt.'
read -p 'Install Homebrew.' unused

echo 'Installing useful utilities.'
brew install bat eza fd fzf htop ripgrep stow tldr tmux tree

echo 'Setting up fzf...'
$(brew --prefix)/opt/fzf/install

echo 'Installing some symlinks using stow...'
stow --target=$HOME git tmux vim zsh

ZED_DIR="$HOME/.config/zed"
mkdir -p "$ZED_DIR"
stow --target="$ZED_DIR" zed

read -p 'Install Cursor.' unused
echo 'Linking Cursor settings and keybindings in.'
CURSOR_DIR="$HOME/Library/Application Support/Cursor/User"
rm -f "$CURSOR_DIR/settings.json" && stow --target="$CURSOR_DIR" cursor
