#!/bin/sh
brew install nodejs
brew install neovim/neovim/neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc ~/.vimrc
brew install python3
pip3 install --user neovim
npm install -g typescript
npm install -g tslint
nvim +PluginInstall +qall
make -C ~/.vim/bundle/vimproc.vim
~/.vim/bundle/YouCompleteMe/install.sh
