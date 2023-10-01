#!/bin/sh
alias k='kubectl'
alias ks='kubectl -n kube-system'
alias kp='kubectl get pods'
alias kx='kubectx'
alias kn='kubens'

# create k3d local cluster
klc() {
  k3d cluster create -p "8081:80@loadbalancer" --agents 2
}
