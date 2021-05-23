#!/bin/bash

current_user=$(whoami)
zsh_path=$(which zsh)

[ ! $(grep -q "zsh" "/etc/shells") ] || $zsh_path | sudo tee -a /etc/shells

if [ "$(uname -s)" == "Darwin" ]
then
  if [[ ! "$SHELL" =~ "zsh" ]]
  then
    echo Changing
    sudo chsh -s $zsh_path $current_user
  fi
fi

unset current_user zsh_path

mkdir -p ~/.zsh

# auto-suggestions
if [[ ! -d ~/.zsh/zsh-autosuggestions ]]
then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# syntax highlighting
if [[ ! -d ~/.zsh/zsh-syntax-highlighting ]]
then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
