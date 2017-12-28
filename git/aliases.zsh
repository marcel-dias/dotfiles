#!/bin/sh
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias gd='git diff'
alias gc='git clone'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -S -m'
alias gs='git status -sb'
alias gcb='git-copy-branch-name'
alias gst='git status'
alias grh='git reset HEAD'
alias gfu='git fetch upstream'
alias gusub='git submodule update --recursive --remote'
alias gp='git push'
alias gpo='git-promote'

gi() {
  curl -s "https://www.gitignore.io/api/$*";
}
