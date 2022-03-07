#!/bin/bash

mkdir -p ~/.config/coc

# Language servers
npm install -g typescript typescript-language-server

if [[ "$(uname -s)" = "Darwin" ]]
then
  nvim +PlugInstall +qall
# else
#   ~/.bin/nvim +PlugInstall +qall
fi
