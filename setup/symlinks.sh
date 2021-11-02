#!/usr/bin/env bash

################################################################################################################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles          #
################################################################################################################

# dotfiles directory
dotfiledir=$HOME/dotfiles

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# list of files/folders to symlink in ${homedir}
files=(atom config init mackup.cfg)

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} $HOME/.${file}
done
