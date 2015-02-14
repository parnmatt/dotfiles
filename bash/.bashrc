# Configuration file for Bash
# Options below can be overridden in ~/.bashrc.local

# Set Prompt
export PS1="[\u@\h \W]\\$ "

# Set editor
export EDITOR="vim"

# Load ~/.bashrc.local
[[ -x $HOME/.bashrc.local ]] && source "$HOME/.bashrc.local"
