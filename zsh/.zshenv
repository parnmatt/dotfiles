# Environment variables for Zsh

export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

typeset -U path

[[ -x "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
