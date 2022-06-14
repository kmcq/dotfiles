#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p ~/.config/coc

# Language servers
npm install -g typescript typescript-language-server

if [[ "$(uname -s)" = "Darwin" ]]
then
  nvim --headless -c "PlugInstall | qa"
else
  ~/.bin/nvim --headless -c "PlugInstall | qa"
fi
