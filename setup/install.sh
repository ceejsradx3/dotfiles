#!/usr/bin/env bash

# Check if homebrew is installed
if ! is_executable "brew"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  success "Homebrew successfully installed... continuing"
else
  success "Homebrew already installed, continuing..."
fi

# Uncomment this section if you are running a Mac with an Apple Silicon processor
# Be sure to change username here!
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ceejsradx3/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install brew packages
brew install cask
brew install mackup
brew install mas
brew install wget
brew install grep
brew install openssh
brew install neofetch
brew install tree
brew install curl
brew install openssl
brew install coreutils
brew install moreutils
brew install findutils
brew install binutils
brew install dockutil
brew install nmap
brew install telnet
brew install dnstracer
brew install ipcalc
brew install mtr
brew install speedtest-cli

# ops
brew install ansible
brew install docker
brew install cyberduck

# dev
brew install git
brew install ruby
brew install python
brew install tmux

# install macOS apps
brew install google-chrome
brew install discord
brew install handbrake
brew install yacreader
brew install microsoft-remote-desktop
brew install microsoft-teams
brew install github
brew install gns3
brew install virtualbox
brew install wireshark
brew install angry-ip-scanner
brew install putty
brew install the-unarchiver
brew install caffeine
brew install synergy-core
brew install karabiner-elements
brew install visual-studio-code

mas install bettersnaptool

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"