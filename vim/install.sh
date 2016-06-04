#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && brew install vim
vim +PluginInstall +qall >/tmp/vim-plugins.log 2>&1 || true
