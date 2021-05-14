#!/bin/bash

config_dir=~/.config
config_file=$config_dir/gh/config.yml

mkdir -p $config_dir

if [ ! -f "$config_file" ]; then
  echo "No GH cli config found. Symlinking to dotfiles"
  ln -s ~/.dotfiles/gh "$config_dir"
fi
