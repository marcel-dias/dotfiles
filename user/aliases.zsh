#!/bin/sh
alias src='cd ~/Code'
alias blog='cd ~/Code/marceldiass.github.io'
alias wildfly='cd /Applications/wildfly'
alias dps='docker ps -a'
alias dm='docker $(docker-machine config)'
alias dmps='docker $(docker-machine config) ps -a'
alias dms='docker-machine start'
alias drmi='docker rmi $(docker images -f "dangling=true" -q )'
