# Configuration file for Bash
# Options below can be overridden in ~/.bashrc.local

# Set Prompt
export PS1="[\u@\h \W]\\$ "

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

# Load ~/.bashrc.local
[[ -f $HOME/.bashrc.local ]] && source "$HOME/.bashrc.local"

# Bash aliases
alias bashconfig="$EDITOR ~/.bashrc"
