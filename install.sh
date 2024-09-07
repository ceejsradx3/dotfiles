#!/bin/sh

echo "Setting up your Mac..."

# check for and install homebrew
echo 
source ./setup/brew.sh

# configure terminal by installing ohmyzsh and powerlevel10k theme
echo 
source ./setup/terminal.sh

# restore backup
echo "Restoring your mackup backup..."
mackup restore

# load macOS preferences
echo "Loading your MacOS preferences.."
source ./setup/macos

# replace dock apps
echo "Configuring your dock..."
source ./setup/dock.sh

# remove dotfiles folder
echo "Cleaning up my mess..."
cd ..
sudo rm -r -f /dotfiles/

# start install services and plugins
brew services start skhd