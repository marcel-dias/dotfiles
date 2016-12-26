#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
sed -e "s;/Users/USERNAME/.dotfiles;$ZSH;" \
    -e "s;/Users/USERNAME;/Users/$USERNAME;" \
    "$ZSH"/iterm/com.googlecode.iterm2.plist.example > "$ZSH"/iterm/com.googlecode.iterm2.plist
defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$ZSH/iterm"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true
