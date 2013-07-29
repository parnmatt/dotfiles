# this sets the prompt to my username and directory
export PS1="[\u@\h \W]\\$ "

# Set Editor to TextMate
export EDITOR="mate -w"

# Set the TeX 'e' edit option to use TextMate
export TEXEDIT="mate -w -l %d '%s'"

# Set the 'less' editor to be TextMate
export LESSEDIT="mate -l %lm %f"

# Change mvim to open arguments in tabs
alias mvim="open -a MacVim"

# Change to Download folder
alias dls="cd ~/Downloads/"

# Change to Code folder
alias code="cd ~/Code/"

# Change to Notes folder
alias notes="cd ~/Documents/Notes/"

# Minecraft
alias minecraft="~/Code/Bash/minecraft.sh"

# open everything in directory individually
function openind () {
	for file in *; do
		open $file
	done
}

# run vm
alias arch="open ~/VirtualBox\ VMs/Arch/Arch.vbox"

# Explode directory
alias explode="~/Code/Ruby/explode.rb"

# Order images *.jpg only
alias imgorder="~/Code/Ruby/image_order.rb"

# Current IP
alias ip="ipconfig getifaddr en1"

function mkv2mp4 () {
	for file in *.mkv; do
		ffmpeg -i $file -acodec copy -vcodec copy ${file%.*}.mp4
	done
}


# Create a *.tar.xz compressed archive
function txz() {
	tar -cf - ${@:3} | xz $1 > $2.tar.xz
}

# Extract from tar in new directory of the same name
function untar() {
	mkdir -p ${1%.tar}
	tar -C ${1%.tar} -xf $1
}


# Curriculum Vitae
alias cv="cd ~/Documents/Curriculum_Vitæ/ && open cv_info.tex"

# Current Project
alias proj="cd ~/Documents/Current\ Project"

function ccv() {
	pdflatex -shell-escape cv_brief
	pdflatex -shell-escape cv_refs
	pdflatex -shell-escape cv_full
	open cv_full.pdf
}

# oDesk
function oDesk() {
	cd ~/oDesk/
	open .
	open /Applications/oDesk\ Team.app/
	open https://www.odesk.com/d/home/
}

# Ingrida
alias ingrida="cd ~/Dropbox/Ingrida/ && open ."

# LaTeX
# go to latex directory
alias cdtex="cd ~/Documents/LaTeX/"

# go to and openlatex directory
function cdotex() {
	cdtex
	open .
}

# LaTeX clean up files
alias ctex="rm *.{*[0-9],aux,bbl,blg,lof,lol,lot,log,mp,nav,out,pyg,snm,synctex.gz,toc} &> /dev/null"

# print latex directory
function ptex () {
	cdtex
	pwd
}

# quick compile
function qtex() {
	pdflatex -shell-escape $1
}

# quick compile and open
function otex() {
	qtex $1
	open ${1%.*}.pdf
}

# TODO try and put `feynman` into `ltex`
# TODO try and fix the pdflatex qtex
# Compile and open
function ltex() {
	ctex
	find . -type f -name "*.bib" -maxdepth 1 -exec pdflatex -shell-escape $1 \; -exec bibtex $1 \;
	qtex $1
	otex $1
}

# LaTeX Feynman diagrams
function feynman() {
	qtex $1
	for file in *.mp; do
		mpost $file
	done
	otex $1
}

# handout
alias handout="pdfjam --nup '2x2' --landscape --frame 'true' --delta '5mm 5mm' --scale '0.95' --suffix 2x2 -- "


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

# Go to Physics Course
function course () {
	cd ~/Documents/Physics/Y${1:0:1}/$1
}

# VLC command line
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"

# load root
. $(brew --prefix root)/bin/thisroot.sh

# Set /usr/local/bin to be the front of the $PATH
export PATH="/usr/local/bin:$(echo $PATH | sed 's/\/usr\/local\/bin\://')"

# Perceptyx, Inc. rst2pdf front end script
export PyxDocRoot="/Users/parnmatt/oDesk/Perceptyx\,\ Inc\./2\ Converting\ PDF\ and\ Word\ documents\ to\ RestructedText"
alias PyxDoc="$PyxDocRoot/PyxDoc.sh"
