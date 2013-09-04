# Configuration file for Zsh
# Options below can be overridden in ~/.zshrc.local

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Disable oh-my-zsh auto-update
DISABLE_AUTO_UPDATE="true"

# Set oh-my-zsh theme [~/.oh-my-zsh/themes/]
ZSH_THEME="bira"

# oh-my-zsh plugins [~/.oh-my-zsh/plugins/] 
plugins=(cp extract git history)

# Load ~/.shellrc
[[ -f $HOME/.shellrc ]] && source "$HOME/.shellrc"

# Load ~/.zshrc.local
[[ -f $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

# Zsh aliases
alias zshconfig="$EDITOR $HOME/.zshrc"
alias ohmyzsh="$EDITOR $HOME/.oh-my-zsh"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
