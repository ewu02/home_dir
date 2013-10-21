# #!/bin/bash

# Installs oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Removes configuration files in $HOME directory
rm -f ~/.vimrc ~/.zshrc ~/.gitignore_global

# Create hard links in $HOME directory to configuration files
ln .vimrc ~/.vimrc
ln .zshrc ~/.zshrc
ln .gitignore_global ~/.gitignore_global

# Installs Vundle in $HOME directory
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Installs or updates all bundles in vundle 
vim +BundleInstall! +qall
