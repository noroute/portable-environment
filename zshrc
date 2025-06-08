# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(brew encode64 extract fasd git github git-extras httpie node npm nvm python pip pyenv python ssh-agent tmux urltools)

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
