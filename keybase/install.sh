#!/bin/sh

if [ ! -f ~/.gnupg/gpg.conf ]; then
  touch ~/.gnupg/gpg.conf
fi

# add the use-agent line to ~/.gnupg/gpg.conf
GPG_USE_AGENT=$(grep -e "use-agent" ~/.gnupg/gpg.conf)
if [ "x$GPG_USE_AGENT" == "x" ]; then
  echo "use-agent" >> ~/.gnupg/gpg.conf
fi

if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
  touch ~/.gnupg/gpg-agent.conf
fi

{
  echo "default-cache-ttl 600"
  echo "max-cache-ttl 600"
  echo "pinentry-program /opt/homebrew/bin/pinentry-touchid"
} > ~/.gnupg/gpg-agent.conf
