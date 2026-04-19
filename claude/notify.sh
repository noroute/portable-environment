#!/bin/bash
if [ -n "$TMUX" ]; then
    CTX=$(tmux display-message -p '#S:#W')
else
    CTX=$(basename "$PWD")
fi
osascript -e "display notification \"Waiting for input\" with title \"Claude Code\" subtitle \"$CTX\""
