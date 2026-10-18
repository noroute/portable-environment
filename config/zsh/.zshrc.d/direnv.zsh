(( $+commands[direnv] )) || return 1
eval "$(direnv hook zsh)"
