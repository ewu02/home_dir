# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler rails git ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias downloads='cd ~/Downloads'
alias excel='open -a /Applications/Microsoft\ Office\ 2011/Microsoft\ Excel.app'
alias number='open -a /Applications/Numbers.app'
alias word='open -a /Applications/Microsoft\ Office\ 2011/Microsoft\ Word.app'

# Bypass issues with zshrc rails plugin 
alias rails='rails'
alias rake='rake'

# Enable shims and autocompletion for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Needed by mvn to use jdk 1.7
export JAVA_HOME=$(/usr/libexec/java_home)

# Activates zsh's mv utility
autoload -U zmv
# Automatic conversion
#   of the wildcards into the appropriate syntax; no need to quote the argument
alias mmv='noglob zmv -W'

# Use Homebrew's directories for rbenv (rather than ~/.rbenv)
export RBENV_ROOT=/usr/local/var/rbenv
# Set ruby and gem path to rbenv root
export PATH="$RBENV_ROOT/bin:$PATH"
export PATH="$RBENV_ROOT/shims:$PATH"
