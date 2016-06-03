#!/bin/sh
brew install nodejs
brew install neovim/neovim/neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew install python3
pip3 install --user neovim
npm install -g typescript
vim +PluginInstall +qall
~/.vim/bundle/YouCompleteMe/install.sh
