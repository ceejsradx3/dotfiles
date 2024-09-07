
echo "Installing Homebrew, your desired packages, and applications..."

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