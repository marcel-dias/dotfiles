# gpg-agent
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

# add the use-agent line to ~/.gnupg/gpg.conf
GPG_USE_AGENT=`grep -e "#use-agent" ~/.gnupg/gpg.conf`
if [ "x$GPG_USE_AGENT" != "x" ]; then
  echo "use-agent" >> ~/.gnupg/gpg.conf
fi

if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
  touch ~/.gnupg/gpg-agent.conf
  echo "use-standard-socket\npinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
fi
