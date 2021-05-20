#!/bin/bash

current_user=$(whoami)
zsh_path=$(which zsh)

[ ! $(grep -q "zsh" "/etc/shells") ] || $zsh_path | sudo tee -a /etc/shells

if [ "$(uname -s)" == "Darwin" ]
then
  sudo chsh -s $zsh_path $current_user
fi

unset current_user zsh_path
