#!/bin/bash

# Install Brew if it's not already installed
if ! [ -x "$(command -v brew)" ]; then
  echo "Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Install dependencies defined in Brewfile
brew tap Homebrew/bundle
brew update
brew bundle --file="$script_dir/Brewfile"
brew bundle --file="$script_dir/Brewfile.darwin"

exit 0
