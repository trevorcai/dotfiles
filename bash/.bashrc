# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Comment to disable color prompt
color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] ${?##0}\[\033[00m\]\$ '
else
    PS1='\u@\h:\w ${?##0}\$ '
fi
unset color_prompt

# ls should use / after directory names and be colored
alias ls='ls -Gp'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set bash completion to ignore case
bind "set completion-ignore-case on"

# Enable global pip
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# add git completion
[ -f ~/.git-completion.sh ] && source ~/.git-completion.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
FZF_TMUX=1
FZF_CTRL_R_OPT="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
if command -v rg > /dev/null ; then
  export FZF_DEFAULT_COMMAND='rg --files --color=never --hidden --glob ""'
  FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
fi
