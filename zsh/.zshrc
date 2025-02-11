setopt HIST_EXPIRE_DUPS_FIRST  # Remove dupes.
setopt HIST_IGNORE_DUPS  # Don't write consecutive dupes.
HISTSIZE=10000000
SAVEHIST=10000000

bindkey -e  # emacs key bindings
bindkey '^U' backward-kill-line  # ctrl+U deletes from cursor to start of line

# smartcase autocomplete.
autoload -U compinit  && compinit
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

# Prompt.
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}% %{$fg[green]%}\$ %{$reset_color%}%"

# c-x c-e for long edits
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Alias ls to eza if installed.
command -v eza > /dev/null && alias ls=eza

# bat should adapt to themes
command -v bat > /dev/null && alias bat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"

# rg config
[ -f ~/.rgrc ] && export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# FZF. Prefer fd over rg if possible.
source <(fzf --zsh) || ([ -f ~/.fzf.zsh ] && source ~/.fzf.zsh)
if command -v fd > /dev/null ; then
  FZF_DEFAULT_COMMAND='fd --type f --color=never'
  FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
  FZF_ALT_C_COMMAND='fd --type d --color=never'
elif command -v rg > /dev/null ; then
  FZF_DEFAULT_COMMAND='rg --files --color=never'
  FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
fi
FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# Overwrite FZF alt-C to pick a file.
if [ -n $FZF_ALT_C_COMMAND ]; then
  fzf-cd-widget() {
    FZF_CTRL_T_COMMAND=$FZF_ALT_C_COMMAND fzf-file-widget
  }
fi

export TLDR_AUTO_UPDATE_DISABLED=1

# secrets
[ -f ~/.secrets ] && source ~/.secrets
