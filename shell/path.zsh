#!/bin/zsh

# --- System ---
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$(brew --prefix)/bin"

# --- Node/NVM ---
export PATH="$PATH:/usr/local/share/npm/bin:$HOME/.npm/bin"
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

[[ -a /opt/homebrew/opt/nvm/nvm.sh ]] && source /opt/homebrew/opt/nvm/nvm.sh

# --- Ruby/rbenv ---
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# --- Starship ---
export STARSHIP_CONFIG=~/.config/starship/config.toml

# --- User tools ---
export ZSH_WAKATIME_BIN=/opt/homebrew/bin/wakatime-cli
export TFENV_AUTO_INSTALL=true
