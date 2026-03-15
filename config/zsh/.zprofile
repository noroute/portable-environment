#!/bin/zsh
#
# .zprofile - Zsh profile file, loaded for login shells (after /etc/zprofile).
#

# Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

# Prepend user paths (highest priority).
path=(
    $HOME/{,s}bin(N)
    $HOME/.local/{,s}bin(N)
    $path
)
