#!/bin/bash
#
# Dependencies
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew for Mac or other scripts for Codespaces.

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Install the correct homebrew for each OS type
if [[ "$(uname -s)" = "Darwin" ]]
then
  bash "$script_dir/install-mac.sh"
else
  bash "$script_dir/install-codespaces.sh"
fi

exit 0
