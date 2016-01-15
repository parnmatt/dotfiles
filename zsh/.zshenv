# Environment variables for Zsh

export EDITOR="vim"

typeset -U path

[[ -x "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
