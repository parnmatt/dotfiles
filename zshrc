# Configuration file for Zsh
# Options below can be overridden in ~/.zshrc.local

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set oh-my-zsh theme [~/.oh-my-zsh/themes/]
ZSH_THEME="bira"

# Editor to vim
export EDITOR="vim"

# SSH into HEP Lancaster
function hep () {
	ssh mp@lap$1.lancs.ac.uk
}

# SCP to HEP Lancaster
function cptohep () {
	scp $2 mp@lap$1.lancs.ac.uk:$3
}

# SCP from HEP Lancaster
function cpfromhep () {
	scp mp@lap$1.lancs.ac.uk:$2 $3
}

# oh-my-zsh plugins [~/.oh-my-zsh/plugins/] 
plugins=(cp extract git history)

# Load ~/.zshrc.local
[[ -f $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

# Zsh aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
