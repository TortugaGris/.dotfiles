#!/bin/bash

apt-get update
apt-get install sudo
sudo apt-get install zsh git neovim

cd

git clone https://github.com/TortugaGris/.dotfiles.git

mkdir -p ~/.config/nvim/
ln -fs ~/.dotfiles/init.lua ~/.config/nvim/init.lua
ln -fs ~/.dofiles/lua ~/.config/nvim/lua

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
ln -fs ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

# ZSH
ln -fs ~/.dotfiles/.zshrc ~/.zshrc
chsh -s "$(command -v zsh)"

# LSD
wget https://github.com/Peltoche/lsd/releases/download/0.22.0/lsd-musl_0.22.0_amd64.deb -P ~/download
sudo dpkg -i ~/download/lsd-musl_0.22.0_amd64.deb
echo 'alias ls="lsd"' >> ~/.zshrc
