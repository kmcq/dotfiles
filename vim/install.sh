#!/bin/bash

mkdir -p ~/.config/coc

# Language servers
npm install -g typescript typescript-language-server

nvim +PlugInstall +qall
