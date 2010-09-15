#!/usr/bin/zsh
# -*- mode: shell-script -*-
#
# .zshrc - customisations for the all-powerful shell

# If running interactively, then:
if [ "$PS1" ]; then
    # generic
    source $HOME/.zsh/generic
    # hosts
    for h in $HOME/.zsh/host_specific/* ; do
	source $h
    done
    # functions
    for f in $HOME/.zsh/functions/* ; do
	source $f
    done
fi
