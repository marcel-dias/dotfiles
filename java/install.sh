#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0

# install some java stuff
brew install maven
