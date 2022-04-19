#!/bin/sh

if [ ! -f ~/.gnupg/gpg.conf ]; then
  touch ~/.gnupg/gpg.conf
fi

# add the use-agent line to ~/.gnupg/gpg.conf
GPG_USE_AGENT=$(grep -e "use-agent" ~/.gnupg/gpg.conf)
if [ "x$GPG_USE_AGENT" != "x" ]; then
  echo "use-agent" >> ~/.gnupg/gpg.conf
fi

if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
  touch ~/.gnupg/gpg-agent.conf

  {
    echo "default-cache-ttl 0"
    echo "max-cache-ttl 0"
    echo "pinentry-program /opt/homebrew/bin/pinentry-touchid"
  } >> ~/.gnupg/gpg-agent.conf
fi
