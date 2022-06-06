#!/bin/bash

config_dir=~/.hammerspoon
config_file=$config_dir/init.lua
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p $config_dir

if [ ! -f "$config_file" ]; then
  echo "No Hammerspoon config found. Symlinking to dotfiles"
  ln -s "$script_dir/init.lua" "$config_file"
fi

if [ ! -d ~/.hammerspoon/Spoons/ControlEscape.spoon ] ; then
  git clone -q https://github.com/jasonrudolph/ControlEscape.spoon.git ~/.hammerspoon/Spoons/ControlEscape.spoon
  cd ~/.hammerspoon/Spoons/ControlEscape.spoon
  script/setup
fi
