#!/bin/bash

# Install dependencies
apt-get update
apt-get install sudo
sudo apt-get install zsh git wget curl build-essential fzf nodejs npm python3 python3-pip python3-venv

# Clone dotfiles
cd ~/
git clone https://github.com/TortugaGris/.dotfiles.git

# Symbolic link of .gitconfig
ln -fs ~/.dotfiles/.gitconfig ~/.gitconfig

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

# Install Neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -P ~/download
sudo tar -C ~/download -xzf ~/download/nvim-linux64.tar.gz
mkdir -p ~/.local
cp -r ~/download/nvim-linux64/* ~/.local

# Symbolic link of neovim config
mkdir -p ~/.config/nvim/
ln -fs ~/.dotfiles/init.lua ~/.config/nvim/init.lua
ln -fs ~/.dotfiles/lua ~/.config/nvim/lua

zsh
