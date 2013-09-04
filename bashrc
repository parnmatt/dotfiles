# Configuration file for Bash
# Options below can be overridden in ~/.bashrc.local

# Set Prompt
export PS1="[\u@\h \W]\\$ "

# Load ~/.shellrc
[[ -f $HOME/.shellrc ]] && source "$HOME/.shellrc"

# Load ~/.bashrc.local
[[ -f $HOME/.bashrc.local ]] && source "$HOME/.bashrc.local"

# Bash aliases
alias bashconfig="$EDITOR $HOME/.bashrc"
