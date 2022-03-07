#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p ~/.config/coc

# Language servers
npm install -g typescript typescript-language-server

if [[ "$(uname -s)" = "Darwin" ]]
then
  nvim +PlugInstall +qall
else
  ~/.bin/nvim -u "$script_dir/../nvim/initial-setup.nvim"
fi
