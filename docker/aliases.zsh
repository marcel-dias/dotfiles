#!/bin/sh
alias dps='docker ps -a'
alias dm='docker $(docker-machine config)'
alias dmps='docker $(docker-machine config) ps -a'
alias dms='docker-machine start'
alias drmi='docker rmi $(docker images -f "dangling=true" -q )'
alias dri='docker rmi'
alias di='docker images'
alias drm='docker rm $(docker ps -q -f "status=exited")'
