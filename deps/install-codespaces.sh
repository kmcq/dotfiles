#!/bin/bash

# nodenv
curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer | bash

# rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

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

# Install tmux
sudo apt-get install -y tmux
