#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0

defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$ZSH/iterm"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true

curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
