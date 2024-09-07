#!/bin/sh

echo "Setting up your Mac..."

# check for and install homebrew
echo 
source ./setup/brew.sh

echo "Configuring your terminal..."
# install oh-my-zsh
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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