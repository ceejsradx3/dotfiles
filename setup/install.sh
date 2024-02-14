#!/usr/bin/env bash

# Check if homebrew is installed
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Uncomment this section if you are running a Mac with an Apple Silicon processor
# Be sure to change username here!
#echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ceejsradx3/.zprofile
#eval "$(/opt/homebrew/bin/brew shellenv)"

  success "Homebrew successfully installed... continuing"
else
  success "Homebrew already installed, continuing..."
fi

# update homebrew recipes
brew update

# install dependencies from brewfile
brew tap homebrew/bundle
brew bundle --file ./setup/brewfile

brew services start skhd

# install oh-my-zsh
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
