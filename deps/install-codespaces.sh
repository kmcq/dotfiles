#!/bin/bash

sudo apt-get install -y ripgrep tmux

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
$HOME/.asdf/asdf.sh plugin-list | grep nodejs || $HOME/.asdf/asdf.sh plugin-add nodejs
$HOME/.asdf/asdf.sh plugin-list | grep ruby || $HOME/.asdf/asdf.sh plugin-add ruby

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

# Install neovim
sudo apt --reinstall -y install fuse
mkdir -p $HOME/.bin
curl -L -o $HOME/.bin/nvim https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
chmod a+x $HOME/.bin/nvim

# Install diff-so-fancy
npm i -g diff-so-fancy
