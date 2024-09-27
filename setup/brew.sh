#!/bin/sh bash

echo
echo "Installing Homebrew..."
echo

# Check if homebrew is installed
if test ! $(which brew); then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ "$processor_brand" == *"Apple"* ]]; then
    echo "Apple Processor is present..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  success "Homebrew successfully installed... continuing"
else
  success "Homebrew already installed, continuing..."
fi

echo
echo "Installing brew formulae and apps..."
echo

# update homebrew recipes
brew update && brew upgrade

# install formulae and apps from brewfile
brew bundle --global --file ./setup/brewfile

# clean up
brew update && brew upgrade &&  brew doctor && brew cleanup

# start install services and plugins
skhd --start-service
yabai --start-service