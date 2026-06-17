#!/bin/zsh

# --- Navigation ---

# cd to $PROJECTS directory
c() {
  cd "$PROJECTS/$1"
}

# cd to $ZSH directory
d() {
  cd "$ZSH/$1"
}

# cd to $HOME directory
h() {
  cd "$HOME/$1"
}

# --- Archive extraction ---
# credit: http://nparikh.org/notes/zshrc.txt
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar -jxvf "$1"                        ;;
      *.tar.gz)   tar -zxvf "$1"                        ;;
      *.bz2)      bunzip2 "$1"                          ;;
      *.dmg)      hdiutil mount "$1"                    ;;
      *.gz)       gunzip "$1"                           ;;
      *.tar)      tar -xvf "$1"                         ;;
      *.tbz2)     tar -jxvf "$1"                        ;;
      *.tgz)      tar -zxvf "$1"                        ;;
      *.zip)      unzip "$1"                            ;;
      *.ZIP)      unzip "$1"                            ;;
      *.pax)      pax -r < "$1"                         ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      *.Z)        uncompress "$1"                       ;;
      *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# --- User utilities ---

decode() {
  echo "$@" | base64 --decode
}


# --- System ---

# Greps non-ascii characters
nonascii() {
  LANG=C grep --color=always '[^ -~]\+'
}

# --- Java/Maven ---

BOLD=$(tput bold)
TEXT_RED=$(tput setaf 1)
TEXT_GREEN=$(tput setaf 2)
TEXT_YELLOW=$(tput setaf 3)
TEXT_BLUE=$(tput setaf 4)
RESET_FORMATTING=$(tput sgr0)

# --- Kubernetes ---

# Create k3d local cluster
klc() {
  k3d cluster create -p "8081:80@loadbalancer" --agents 2
}

kroll() {
  ns="$1"
  k rollout restart -n $ns $(k get deploy -n $ns -o name)
}

krollall() {
  for ns in $(kubectl get ns -o jsonpath='{.items[*].metadata.name}'); do
    kroll "$ns"
  done
}

kdrain() {
  nodes="$@"
  echo "nodes==$nodes"
  k drain --delete-emptydir-data --ignore-daemonsets $nodes
}

knote() {
  ns="$1"
  k annotate $(k get es -n $ns -o name) force-sync=$(date +%s) --overwrite -n $ns
}
