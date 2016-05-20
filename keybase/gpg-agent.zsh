# gpg-agent
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

#vim ~/.gnupg/gpg.conf
# uncomment the use-agent line


if test -f ~/.gnupg/gpg-agent.conf; then
  touch ~/.gnupg/gpg-agent.conf
  echo "use-standard-socket\npinentry-program /usr/local/bin/pinentry-mac" ~/.gnupg/gpg-agent.conf
fi
