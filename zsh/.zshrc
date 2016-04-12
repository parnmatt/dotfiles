# Configuration file of ZSH
# Options below can be overridden in local scripts

# Load framework
[[ -x "$HOME/.config/zsh/framework" ]] && source "$HOME/.config/zsh/framework" 

[[ -x "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

# Load local scripts
[[ -x "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
