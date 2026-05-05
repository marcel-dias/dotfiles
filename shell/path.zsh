#!/bin/zsh

# --- System ---
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/opt/homebrew/bin"

# --- Node/NVM (lazy loaded) ---
export PATH="$PATH:/usr/local/share/npm/bin:$HOME/.npm/bin"
export NVM_DIR="$HOME/.nvm"

# Lazy-load NVM: only source nvm.sh on first use of nvm/node/npm/npx
_nvm_lazy_load() {
  unset -f nvm node npm npx
  [[ -a /opt/homebrew/opt/nvm/nvm.sh ]] && source /opt/homebrew/opt/nvm/nvm.sh
}
nvm() { _nvm_lazy_load; nvm "$@" }
node() { _nvm_lazy_load; node "$@" }
npm() { _nvm_lazy_load; npm "$@" }
npx() { _nvm_lazy_load; npx "$@" }

# --- Ruby/rbenv ---
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# --- Starship ---
export STARSHIP_CONFIG=~/.config/starship/config.toml

# --- User tools ---
export TFENV_AUTO_INSTALL=true
