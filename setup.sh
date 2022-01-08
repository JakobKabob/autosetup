sudo apt update && sudo apt upgrade -y
sudo apt install tmux neovim -y
cat tmux.conf.basic > ~/.tmux.conf
[[ -d ~/.config ]] || mkdir ~/.config ~/.config/nvim
[[ -d ~/.config/nvim ]] || mkdir ~/config/nvim
cat init.vim.basic > ~/.config/nvim/init.vim

