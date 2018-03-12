#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

echo "Installing Homebrew for you."

# Install the correct homebrew for each OS type
if [[ "$(uname -s)" = "Darwin" ]]
then
  # Install Brew if it's not already installed
  if ! [ -x "$(command -v brew)" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Install dependencies defined in Brewfile
  brew tap Homebrew/bundle
  brew update
  brew bundle --file="$HOME/dotfiles/homebrew/Brewfile"
  brew bundle --file="$HOME/dotfiles/homebrew/Brewfile.darwin"
fi

exit 0
