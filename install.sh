# #!/bin/bash

# Installs oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Removes configuration files in $HOME directory
rm -f ~/.vimrc ~/.zshrc ~/.gitignore_global ~/.NERDTreeBookmarks ~/.editorconfig

# Create symbolic links in $HOME directory to configuration files
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.gitignore_global $HOME/.gitignore_global
ln -s $PWD/.NERDTreeBookmarks $HOME/.NERDTreeBookmarks
ln -s $PWD/.editorconfig $HOME/.editorconfig

# Installs Vundle in $HOME directory
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Installs homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installs packages
brew install ack git macvim zsh rbenv tree hub ag

# Installs or updates all plugins in vundle
vim +PluginInstall! +qall
