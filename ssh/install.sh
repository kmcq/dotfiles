#!/bin/bash

config_dir=~/.ssh
config_file=$config_dir/config
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p $config_dir

if [ ! -f "$config_file" ]; then
  echo "No SSH config found. Symlinking to dotfiles"
  ln -s "$script_dir/config" "$config_file"
fi
