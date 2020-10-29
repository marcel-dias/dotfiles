#!/bin/sh

if [ ! -f ~/.gnupg/gpg.conf ]; then
  touch ~/.gnupg/gpg.conf
fi

# add the use-agent line to ~/.gnupg/gpg.conf
GPG_USE_AGENT=$(grep -e "#use-agent" ~/.gnupg/gpg.conf)
if [ "x$GPG_USE_AGENT" != "x" ]; then
  echo "use-agent" >> ~/.gnupg/gpg.conf
fi

if [ ! -f ~/.gnupg/gpg-agent.conf ]; then
  touch ~/.gnupg/gpg-agent.conf

  {
    echo "default-cache-ttl 3600"
    echo "max-cache-ttl 3600"
    echo "pinentry-program /usr/local/bin/pinentry-mac"
  } >> ~/.gnupg/gpg-agent.conf
fi
