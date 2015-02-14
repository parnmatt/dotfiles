# Configuration file of ZSH
# Options below can be overridden in local scripts

export EDITOR="vim"

# Load framework
[[ -x "$HOME/.config/zsh/framework" ]] && source "$HOME/.config/zsh/framework" 

# Load local scripts
[[ -x "$HOME/zshrc.local" ]] && source "$HOME/.zshrc.local"
