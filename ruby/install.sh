#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0

if test ! "$(which rvm)"; then
  echo "  Installing rvm for you."
  curl -L https://get.rvm.io | bash -s stable --ruby
fi

if test ! "$(which ruby-build)"; then
  echo "  Installing ruby-build for you."
  brew install ruby-build > /tmp/ruby-build-install.log
fi
