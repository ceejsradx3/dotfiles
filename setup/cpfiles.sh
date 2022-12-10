#!/usr/bin/env bash

################################################################################################################
# This script creates copies from the home directory of any desired dotfiles in ${homedir}/dotfiles          #
################################################################################################################

# dotfiles directory
dotfiledir=$HOME/dotfiles

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# list of files/folders to copy in ${homedir}
files=(init)

# create copies (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    cp -R ${dotfiledir}/${file} $HOME/.${file}
done
