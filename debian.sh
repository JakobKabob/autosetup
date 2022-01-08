#!/bin/bash

if ! sudo true; then
    echo 'sudo?'
    exit 1
fi
sudo apt update && sudo apt upgrade -y
sudo apt install tmux neovim -y
cat tmux.conf.basic > ~/.tmux.conf

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
[[ -d $HOME/.config ]] || mkdir $HOME/.config $HOME/.config/nvim
[[ -d $HOME/.config/nvim ]] || mkdir $HOME/.config/nvim
cat init.vim.basic > ~/.config/nvim/init.vim

