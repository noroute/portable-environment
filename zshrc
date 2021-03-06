source ~/.profile

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="noroute"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(brew bundler colored-man encode64 extract fasd gem git github git-extras gradle httpie mvn node npm osx python ruby rvm pip pyenv python ssh-agent tmux urltools vagrant zsh-syntax-highlighting)

# Customize to your needs...
export LOCALE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# share_history is annoying with multiple shells at the same time
unsetopt share_history

# Emacs keybindings
bindkey -e

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

#### Prefer Homebrew ####
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PATH=$HOME/bin:$PATH

### pyenv ###
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export GOPATH="$HOME/go"

## NVM ##
export NVM_DIR="/Users/flo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Finally source ohmyzsh
source $ZSH/oh-my-zsh.sh
