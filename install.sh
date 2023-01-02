#!/usr/bin/sh

echo "Setting up your Mac..."

echo "Installing Homebrew, your desired packages, and applications..."
# run the Homebrew Script
source ~/dotfiles/setup/brew.sh

echo "Restoring your mackup backup..."
# restore backup
mackup restore

echo "Loading your MacOS preferences.."
# load macOS preferences
source ~/dotfiles/macos/macos

echo "Configuring your dock..."
# replace dock apps
source ~/dotfiles/macos/dock.sh

echo "Cleaning up my mess..."
# remove dotfiles folder
sudo rm -r -f ~/dotfiles/