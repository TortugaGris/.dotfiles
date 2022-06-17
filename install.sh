#!/bin/bash

apt-get update

apt-get install sudo

sudo apt-get install zsh git neovim curl

cd

git clone https://github.com/TortugaGris/.dotfiles.git

# Neovim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/
ln -fs ~/.dotfiles/init.vim ~/.config/nvim/init.vim
nvim --headless +PlugInstall +qa

# zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
ln -fs ~/.dotfiles/.zshrc ~/.zshrc
ln -fs ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
chsh -s "$(command -v zsh)"


echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
