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
#echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ceejsradx3/.zprofile
#eval "$(/opt/homebrew/bin/brew shellenv)"

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
brew install exa

# ops
brew install ansible
brew install --cask docker
brew install --cask cyberduck
brew install --cask postman
brew install --cask github

# dev
brew install git
brew install ruby
#brew install python
brew install tmux

# install macOS apps
brew install google-chrome
brew install --cask discord
brew install --cask handbrake
brew install --cask yacreader
brew install --cask microsoft-remote-desktop
brew install microsoft-teams
brew install --cask gns3
brew install --cask virtualbox
brew install --cask wireshark
brew install angry-ip-scanner
brew install putty
brew install --cask the-unarchiver
brew install --cask caffeine
#brew install synergy-core
brew install --cask karabiner-elements
brew install koekeishiya/formulae/skhd
brew install --cask visual-studio-code
brew install microsoft-office

mas install 1452453066 # hiddenbar
mas install 417375580 # bettersnaptool

brew services start skhd

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
