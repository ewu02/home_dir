# #!/bin/bash

# Removes configuration files in $HOME directory
rm -f ~/.vimrc ~/.zshrc ~/.gitignore_global ~/.NERDTreeBookmarks

# Create symbolic links in $HOME directory to configuration files
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.gitignore_global $HOME/.gitignore_global
ln -s $PWD/.NERDTreeBookmarks $HOME/.NERDTreeBookmarks

