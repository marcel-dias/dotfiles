#!/bin/sh
alias k='kubectl'
alias ks='kubectl -n kube-system'
alias kp='kubectl get pods'
alias kx='kubectx'
alias kn='k get nodes -o wide'
alias knl='k get nodes --show-labels'

# create k3d local cluster
klc() {
  k3d cluster create -p "8081:80@loadbalancer" --agents 2
}

kroll() {
  ns="$1"
  k rollout restart -n $ns $(k get deploy -n $ns -o name )
}

kdrain() {
  nodes="$@"
  echo "nodes==$nodes"
  k drain --delete-emptydir-data --ignore-daemonsets $nodes
}
