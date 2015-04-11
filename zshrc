# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#### RVM ###
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#### Prefer Homebrew ####
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="noroute"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(brew bundler colored-man encode64 extract fasd gem git github git-extras gradle mvn node npm  osx perl python ruby rvm pip python sbt scala ssh-agent svn tmux urltools vagrant zsh-syntax-highlighting)

# Customize to your needs...

# share_history is annoying with multiple shells at the same time
unsetopt share_history

# Emacs keybindings
bindkey -e

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Aliases
alias e="emacsclient -n"
alias z="emacsclient -n ~/.zshrc"
alias et="emacsclient -t"
alias c="pygmentize -O style=monokai -f console256 -g"

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "

export PATH=$HOME/bin:$PATH


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias e=emacsclient -t
alias ec=emacsclient -c

# Finally source ohmyzsh
source $ZSH/oh-my-zsh.sh
