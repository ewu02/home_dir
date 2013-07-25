#!/bin/bash

# Installs Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Installs or updates all bundles in vundle 
vim +BundleInstall! +qall

