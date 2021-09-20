#!/bin/bash

config_dir=~/.config/lvim
config_file=$config_dir/config.lua
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p $config_dir

if [ ! -f "$config_file" ]; then
  echo "No lvim config found. Symlinking to dotfiles"
  ln -s "$script_dir/config.lua" "$config_file"
fi
