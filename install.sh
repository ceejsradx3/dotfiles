#!/bin/sh

clear
echo " _           _        _ _       _     "
echo "(_)         | |      | | |     | |    "
echo " _ _ __  ___| |_ __ _| | |  ___| |__  "
echo "| | |_ \/ __| __/ _  | | | / __| |_ \ "
echo "| | | | \__ \ || (_| | | |_\__ \ | | |"
echo "|_|_| |_|___/\__\__,_|_|_(_)___/_| |_|"
echo
echo
echo Please enter root password

# Ask for the administrator password upfront.
sudo -v

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
#echo "Cleaning up my mess..."
#cd ..
#sudo rm -r -f /dotfiles/

echo "______ _____ _   _  _____ "
echo "|  _  \  _  | \ | ||  ___|"
echo "| | | | | | |  \| || |__  "
echo "| | | | | | | .   ||  __| "
echo "| |/ /\ \_/ / |\  || |___ "
echo "|___/  \___/\_| \_/\____/ "