# smartcase autocomplete.
autoload -U compinit  && compinit
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

# Prompt.
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}% %{$fg[green]%}\$ %{$reset_color%}%"

# Alias ls to exa if installed.
command -v exa > /dev/null && alias ls=exa

# FZF. Prefer fd over rg if possible.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if command -v fd > /dev/null ; then
  export FZF_DEFAULT_COMMAND='fd --type f --color=never'
  FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
  FZF_ALT_C_COMMAND='fd --type d --color=never'
elif command -v rg > /dev/null ; then
  export FZF_DEFAULT_COMMAND='rg --files --color=never'
  FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
fi
FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
FZF_ALT_C_OPTS="--preview 'tree -C {} | head -10'"
