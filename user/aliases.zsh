#!/bin/sh
alias src='cd ~/Code'
alias blog='cd ~/Code/marceldiass.github.io'
alias lg='lazygit'
alias terminal-test="for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done"
alias arm="docker run --rm -it -v ${PWD}:/home/spinnaker armory/arm-cli arm dinghy render dinghyfile"
