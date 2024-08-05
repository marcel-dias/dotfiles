#!/bin/sh
export PATH="$PATH:/usr/local/share/npm/bin:$HOME/.npm/bin"
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

[[ -a /opt/homebrew/opt/nvm/nvm.sh ]] && source /opt/homebrew/opt/nvm/nvm.sh
