# Neovim Configuration
Install neovim
```
sudo apt-get update
sudo apt-get install neovim
```

Install vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Copy `init.vim` to `.config/nvim/` directory
```
mkdir ./config/nvim/
cp init.vim ~/.config/nvim/
```

In `init.vim`
```
:source %
:PlugInstall
```

