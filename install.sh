# #!/bin/bash

# Installs oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Removes configuration files in $HOME directory
rm -f ~/.vimrc ~/.gvimrc ~/.zshrc ~/.gitignore_global ~/.editorconfig

# Create symbolic links in $HOME directory to configuration files
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.gvimrc $HOME/.gvimrc
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.gitignore_global $HOME/.gitignore_global
ln -s $PWD/.editorconfig $HOME/.editorconfig

# Installs homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Installs packages
brew install ack git macvim zsh tree hub ag

# Set up global .gitignore
git config --global core.excludesfile ~/.gitignore_global

# Installs Vundle in $HOME directory
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installs or updates all plugins in vundle
vim +PluginInstall! +qall
