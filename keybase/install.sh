#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  brew install gpg gpg-agent keybase pinentry-mac
fi
