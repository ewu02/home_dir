# #!/bin/bash

# Removes configuration files in $HOME directory
rm -f ~/.vimrc ~/.gvimrc ~/.zshrc ~/.gitignore_global ~/.gvimrc

# Create symbolic links in $HOME directory to configuration files
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.gvimrc $HOME/.gvimrc
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.gvimrc $HOME/.gvimrc
ln -s $PWD/.gitignore_global $HOME/.gitignore_global

