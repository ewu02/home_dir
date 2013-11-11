# #!/bin/bash

# Removes configuration files in $HOME directory
rm -f ~/.vimrc ~/.zshrc ~/.gitignore_global

# Create hard links in $HOME directory to configuration files
ln .vimrc ~/.vimrc
ln .zshrc ~/.zshrc
ln .gitignore_global ~/.gitignore_global
