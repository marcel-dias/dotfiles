#!/bin/zsh

# --- Git ---
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
# gcm is now a script in ~/.dotfiles/bin/gcm (single source of truth, on PATH)
alias gs='git status -sb'
alias gcb='git-copy-branch-name'
alias gst='git status'
alias grh='git reset HEAD'
alias git-undo='git reset --soft HEAD^'
alias gfu='git fetch upstream'
alias gusub='git submodule update --recursive --remote'
alias gp='git push'
alias gpo='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'

# --- Docker ---
alias dps='docker ps -a'
alias drmi='docker rmi $(docker images -f "dangling=true" -q )'
alias dri='docker rmi'
alias di='docker images'
alias drm='docker rm $(docker ps -q -f "status=exited")'

# --- Kubernetes ---
alias k='kubectl'
alias ks='kubectl -n kube-system'
alias kp='kubectl get pods'
alias kx='kubectx'
alias kn='k get nodes -o wide'
alias knl='k get nodes --show-labels'

# --- System ---
if which gls >/dev/null 2>&1; then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la="gls -A --color"
else
  alias ls="ls -Fh --color"
  alias l="ls -lAh --color"
  alias ll="ls -l --color"
  alias la="ls -A --color"
fi

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"
alias lsopenports='lsof -i -n -P'

if [ "$(uname -s)" != "Darwin" ]; then
  if [ -z "$(command -v pbcopy)" ]; then
    if [ -n "$(command -v xclip)" ]; then
      alias pbcopy="xclip -selection clipboard"
      alias pbpaste="xclip -selection clipboard -o"
    elif [ -n "$(command -v xsel)" ]; then
      alias pbcopy="xsel --clipboard --input"
      alias pbpaste="xsel --clipboard --output"
    fi
  fi
  if [ -e /usr/bin/xdg-open ]; then
    alias open="xdg-open"
  fi
fi

# --- Node/npm ---
alias npis='npm install --save'
alias npisd='npm install --save-dev'
alias npig='npm install -g'
alias npit='npm init'
alias npi='npm install'

# --- User ---
alias src='cd ~/Code'
alias blog='cd ~/Code/marceldiass.github.io'
alias lg='lazygit'
alias tf='terraform'
alias tg='terragrunt'
alias pinentry='pinentry-mac'

# --- Shell ---
alias reload!='source ~/.zshrc'


# --- claude ----
alias claude-personal='CLAUDE_CONFIG_DIR=$HOME/.claude-personal claude'

