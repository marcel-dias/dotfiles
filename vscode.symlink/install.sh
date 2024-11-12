#!/bin/sh
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

if [ ! -f ~/Library/Application\ Support/Code/User/settings.json ]; then
  ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
else
  rm ~/Library/Application\ Support/Code/User/settings.json
  ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
fi
