#!/bin/bash

config_dir=~/.config/gh
config_file=$config_dir/config.yml
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p $config_dir

if [ ! -f "$config_file" ]; then
  echo "No GH cli config found. Symlinking to dotfiles"
  ln -s "$script_dir/config.yml" "$config_file"
fi
