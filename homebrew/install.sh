#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Install Brew if it's not already installed
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew for you."
  if [[ "$(uname -s)" = "Darwin" ]]
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    mkdir ~/.linuxbrew/bin
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
    eval $(~/.linuxbrew/bin/brew shellenv)
  fi
fi

# Install dependencies defined in Brewfile
brew tap Homebrew/bundle
brew update
brew bundle --file="$(dirname "$0")/Brewfile"

# Install the correct homebrew for each OS type
if [[ "$(uname -s)" = "Darwin" ]]
then
  brew bundle --file="$HOME/.dotfiles/homebrew/Brewfile.darwin"
fi

exit 0
