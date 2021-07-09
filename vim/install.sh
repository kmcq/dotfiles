#!/bin/bash

mkdir -p ~/.config/coc

# Language servers
npm install -g typescript typescript-language-server

vim +PlugInstall +qall
