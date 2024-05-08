#!/bin/bash

# General dependencies
apt-get update
apt-get install sudo
sudo apt-get install git wget curl build-essential -y

# Clone dotfiles
cd ~/
git clone https://github.com/TortugaGris/.dotfiles.git

# Symbolic link of .gitconfig
ln -fs ~/.dotfiles/.gitconfig ~/.gitconfig

# Zsh dependencies
sudo apt-get install zsh fzf -y

# Install Zap (zsh plugin manager)
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# Symbolic link of powerlevel10k
ln -fs ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

# Install rust, lsd and zoxide
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
~/.cargo/bin/cargo install lsd
~/.cargo/bin/cargo install zoxide --locked

# Symbolic link of ZSH
mkdir -p ~/.config
ln -fs ~/.dotfiles/.zshrc ~/.zshrc
ln -fs ~/.dotfiles/zsh ~/.config/zsh

# Neovim dependencies
sudo apt-get install nodejs npm python3 python3-pip python3-venv -y 

# Install Neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -P ~/download
sudo tar -C ~/download -xzf ~/download/nvim-linux64.tar.gz
mkdir -p ~/.local
cp -r ~/download/nvim-linux64/* ~/.local

# Symbolic link of neovim config
mkdir -p ~/.config/nvim/
ln -fs ~/.dotfiles/init.lua ~/.config/nvim/init.lua
ln -fs ~/.dotfiles/lua ~/.config/nvim/lua

# Tmux dependencies
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config -y

# libevent (tmux dependency)
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz -P ~/download
sudo tar -C ~/download -xzf ~/download/libevent-2.1.12-stable.tar.gz
cd ~/download/libevent-2.1.12-stable/
./configure --prefix=$HOME/.local --enable-shared
make && sudo make install

# ncurses (tmux dependency)
wget https://invisible-island.net/datafiles/release/ncurses.tar.gz -P ~/download
sudo tar -C ~/download -xzf ~/download/ncurses.tar.gz
cd ~/download/ncurses/
./configure --prefix=$HOME/.local --with-shared --with-termlib --enable-pc-files --with-pkg-config-libdir=$HOME/.local/lib/pkgconfig
make && sudo make install

# tmux
wget https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz -P ~/download
sudo tar -C ~/download -xzf ~/download/tmux-3.4.tar.gz
cd ~/download/tmux-3.4/
./configure
make && sudo make install

# Symbolic link of tmux
ln -fs ~/.dotfiles/.tmux.conf ~/.tmux.conf

# Install tmp (plugin manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

zsh
