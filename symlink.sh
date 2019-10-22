#!/bin/sh
# Can only be run as ./symlink.sh because i use `pwd`.

# TODO: This is out of date (no .pip.conf) and hacky.
# Switch to stow or bare git.

# Stash any existing dotfiles.
STASH_DIR="${HOME}/.saved_dotfiles"
echo "Moving dotfiles to ${STASH_DIR}. Any mv errors are ignored."

if [ -d "$STASH_DIR" ]; then
    echo "${STASH_DIR} already exists. Aborting..."
    exit 1
fi

mkdir -p ${STASH_DIR}
mv -f ~/.bashrc ~/.git-completion.sh ~/.gitconfig ~/.tmux.conf ~/.vimrc \
    ~/.gitignore_global "${STASH_DIR}"

# ... and replace them with symlinks to this directory
ln -s "$PWD"/bashrc ~/.bashrc
ln -s "$PWD"/.git-completion.sh ~/.git-completion.sh
ln -s "$PWD"/gitignore_global ~/.gitignore_global
ln -s "$PWD"/gitconfig ~/.gitconfig
ln -s "$PWD"/tmux.conf ~/.tmux.conf
ln -s "$PWD"/vimrc ~/.vimrc
