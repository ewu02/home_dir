#!/bin/bash

rm -f ~/.vimrc ~/.zshrc ~/.gitignore_global

# Create hard links in $HOME directory
ln .vimrc ~/.vimrc
ln .zshrc ~/.zshrc
ln .gitignore_global ~/.gitignore_global

# Installs Vundle in $HOME directory
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Installs or updates all bundles in vundle 
vim +BundleInstall! +qall

# Reload .zshrc
source .zshrc
