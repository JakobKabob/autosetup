#!/bin/bash

if ! sudo true; then
    echo 'error: sudo?'
    exit 1
elif [[ ! $(pwd) == *"autosetup"* ]]; then 
    echo "error: cd into autosetup and make sure its in your home directory before"
    exit 1
fi

my_dir=$(pwd)
HOME=${my_dir%/*}
echo "!! assuming that $HOME is your home directory"

# install tmux & nvim
if [[ ! -z "$(which apt)" ]]; then 
    echo "using apt"
    sudo apt update && sudo apt upgrade -y
    sudo apt install tmux neovim -y
elif [[ ! -z "$(which pacman)" ]]; then
    echo "using pacman"
    sudo pacman -Syu
    sudo pacman -S tmux nvim
else 
    echo "error: pacman nor apt available"
    exit 1
fi

declare -A colour
colour[blue]="white"
colour[red]="white"
colour[grey]="black"
colour[orange]="black"
colour[yellow]="black"

exit 1
# configure tmux
cat tmux.conf.basic > $HOME/.tmux.conf
[[ ! -z $1 ]] && [[ ! -z ${colour[$1]} ]] && echo -e "set -g status-bg $1\nset -g status-fg ${colour[$1]}" >> $HOME/.tmux.conf

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
[[ -d $HOME/config/nvim ]] || mkdir -p $HOME/.config/nvim
cat init.vim.basic > $HOME/.config/nvim/init.vim

