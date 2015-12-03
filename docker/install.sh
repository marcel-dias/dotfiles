#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  brew cask install dockertoolbox
fi
