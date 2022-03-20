# Prompt.
autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}% %{$fg[green]%}\$ %{$reset_color%}%"

# FZF.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FZF_CTRL_R_OPT="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
if command -v rg > /dev/null ; then
  export FZF_DEFAULT_COMMAND='rg --files --color=never --hidden --glob ""'
  FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
fi
