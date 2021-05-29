#!/bin/bash

config_dir=~/.config/nvim
config_file=$config_dir/init.vim
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p $config_dir

if [ ! -f "$config_file" ]; then
  echo "No nvim config found. Symlinking to dotfiles"
  ln -s "$script_dir/init.vim" "$config_file"
fi
