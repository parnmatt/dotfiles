# Configuration file of ZSH
# Options below can be overridden in local scripts

# disable xoff
stty -ixon

# load framework
[[ -x "$HOME/.config/zsh/framework" ]] && source "$HOME/.config/zsh/framework" 

# load local scripts
[[ -x "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
