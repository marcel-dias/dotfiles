#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && brew cask install atom
apm install \
  editorconfig \
  language-docker language-diff \
  linter linter-jshint \
  atom-beautify color-picker \
  go-plus go-rename \
  file-icons \
  angularjs autocomplete-angular-material \
  wakatime || true
