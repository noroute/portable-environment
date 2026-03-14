source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

eval "$(starship init zsh)"
