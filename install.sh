#!/usr/bin/env sh

# This script
scriptDir="`\dirname $0`"
scriptDir="`\cd $scriptDir && \pwd -P`"
scriptFile="`\basename $0`"

# Make backup directory
backupDir="$HOME/.dotfiles_`\date -j "+%Y-%m-%d"`"
\printf "Using backup directory: $backupDir\n"
\mkdir -p $backupDir

# List of file, not including this script,
# README files, licence file and hidden files
files="`\find $scriptDir -d 1 \
	! -name $scriptFile \
	! -name "README*" \
	! -name "*LICEN[SC]E*" \
	! -name '.*'`"

# Iterate through files
\printf "Installing dotfiles... "
for file in $files; do

	# Redefine variable without directory information
	fileDir="`\dirname $file`"
	fileDir="`\cd $fileDir && \pwd -P`"
	fileName="`\basename $file`"
	file="$fileDir/$fileName"
	homeFile="$HOME/.$fileName"

	# Backup file
	if [ -e $homeFile ]; then
		\mv $homeFile $backupDir/$fileName
	fi

	# Create the symlink
	\ln -s $file $homeFile
done

\printf "Completed\n"
