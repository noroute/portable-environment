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

#### Prefer Homebrew ####
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PATH=$HOME/bin:$PATH

export GOPATH="$HOME/go"

## NVM ##
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Finally source ohmyzsh
source $ZSH/oh-my-zsh.sh
