#!/bin/bash

apt-get update
apt-get install sudo
sudo apt-get install zsh git neovim

cd

git clone https://github.com/TortugaGris/.dotfiles.git

# Neovim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim/
ln -fs ~/.dotfiles/init.vim ~/.config/nvim/init.vim
nvim --headless +PlugInstall +qa

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
ln -fs ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

# ZSH
ln -fs ~/.dotfiles/.zshrc ~/.zshrc
chsh -s "$(command -v zsh)"

# Colorls
sudo apt-get install ruby-dev ubuntu-dev-tools
gem install colorls
echo 'source $(dirname $(gem which colorls))/tab_complete.sh' >> ~/.zshrc
echo 'alias ls="colorls"' >> ~/.zshrc
