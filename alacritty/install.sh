#!/bin/bash

config_dir=~/.config/alacritty
config_file=$config_dir/alacritty.yml
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p $config_dir

if [ ! -f "$config_file" ]; then
  echo "No Alacritty config found. Symlinking to dotfiles"
  ln -s "$script_dir/alacritty.yml" "$config_file"
fi
