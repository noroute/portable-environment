#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Add nvm's default node bin to PATH without loading nvm.sh
# Follows alias chain (e.g. default → node → latest installed version)
export NVM_DIR="$HOME/.nvm"
if [[ -f "$NVM_DIR/alias/default" ]]; then
  _nvm_ver="$(cat $NVM_DIR/alias/default)"
  [[ -f "$NVM_DIR/alias/$_nvm_ver" ]] && _nvm_ver="$(cat $NVM_DIR/alias/$_nvm_ver)"
  [[ "$_nvm_ver" != v* ]] && _nvm_ver="$(ls -1 $NVM_DIR/versions/node 2>/dev/null | sort -V | tail -1)"
  [[ -d "$NVM_DIR/versions/node/$_nvm_ver/bin" ]] && path=("$NVM_DIR/versions/node/$_nvm_ver/bin" $path)
  unset _nvm_ver
fi
