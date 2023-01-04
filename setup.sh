#!/usr/bin/sh

echo "Setting up your Mac..."

echo "Installing Homebrew, your desired packages, and applications..."
# run the Homebrew Script
source ./setup/brew.sh

echo "Restoring your mackup backup..."
# restore backup
mackup restore

echo "Loading your MacOS preferences.."
# load macOS preferences
source ./setup/macos

echo "Configuring your dock..."
# replace dock apps
source ./setup/dock.sh

echo "Cleaning up my mess..."
# remove dotfiles folder
cd ..
sudo rm -r -f /dotfiles/