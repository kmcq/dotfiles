#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Install Brew if it's not already installed
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ "$(expr substr $(uname -s) 1 5)" = "Linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
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
