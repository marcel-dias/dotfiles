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

# --- 1Password ---

oplogin() {
  echo "$(op signin my)" > ~/.1passrc
  source ~/.1passrc
}

opgetpass() {
  op get item "$1" | jq -r '.details.fields[] | select( .designation | contains("password")).value' | tr -d '\n\t' | pbcopy
}

# --- Git ---

# Generate .gitignore using gitignore.io
gi() {
  curl -s "https://www.gitignore.io/api/$*"
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

# Wrapper function for Maven's mvn command with colorized output.
# Based on https://gist.github.com/1027800
mvn-color() {
  # Filter mvn output using sed.
  # Before filtering set the locale to C, so invalid characters won't break some sed implementations
  unset LANG
  LC_CTYPE=C mvn "$@" | sed -e "s/\(INFO\)/${BOLD}${TEXT_BLUE}\1${RESET_FORMATTING}/g" \
               -e "s/\(BUILD SUCCESS\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
               -e "s/\(BUILD FAILURE\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
               -e "s/\(WARNING\)/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
               -e "s/\(ERROR\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
               -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${BOLD}${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${BOLD}${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${BOLD}${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${BOLD}${TEXT_YELLOW}\4${RESET_FORMATTING}/g"
  MVN_EXIT=${pipestatus[1]}

  local message="${PWD##*/}"
  if [ "$MVN_EXIT" = 0 ]; then
    message="$message BUILD SUCCESS!"
  else
    message="$message BUILD FAILURE!"
  fi

  which terminal-notifier > /dev/null && terminal-notifier -message "$message"
  which notify-send > /dev/null && notify-send "$message"

  # Make sure formatting is reset
  echo -ne "${RESET_FORMATTING}"
}

# Override the mvn command with the colorized one.
alias mvn="mvn-color"

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
