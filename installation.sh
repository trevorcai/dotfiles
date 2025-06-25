#! /bin/bash

set -e

echo 'Installation script for macOS.'
echo 'Press enter to continue after each prompt.'

echo 'Installing homebrew.'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Installing useful utilities.'
brew install bat eza fd fzf htop ripgrep stow tlrc tmux tree

echo 'Setting up fzf...'
$(brew --prefix)/opt/fzf/install

echo 'Installing some symlinks using stow...'
stow --target=$HOME git tmux vim zsh

echo 'Installing cursor and zed.'
brew install --cask cursor zed

echo ' Installing zed config.'
ZED_DIR="$HOME/.config/zed"
mkdir -p "$ZED_DIR"
stow --target="$ZED_DIR" zed

echo 'Linking Cursor settings.'
CURSOR_DIR="$HOME/Library/Application Support/Cursor/User"
rm -f "$CURSOR_DIR/settings.json" && stow --target="$CURSOR_DIR" cursor
