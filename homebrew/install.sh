#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
[ "$(uname -s)" != "Darwin" ] && exit 0

# Check for Homebrew
if test ! "$(which brew)"; then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# more formualae
brew tap caskroom/versions || true
brew install brew-cask

# usefull stuff
brew install grc coreutils the_silver_searcher htop-osx heroku-toolbelt \
  wget unrar ffmpeg terminal-notifier
brew cask install the-unarchiver diffmerge

# virtualization
brew cask install virtualbox

# chat, books, notes, documents, mail, etc
brew cask install messenger-for-telegram

# browser
brew cask install google-chrome

# Install fonts.
brew tap caskroom/fonts

# watch and download stuff
brew cask install subtitle-master vlc spotify

# pandoc - markdown converter
brew install pandoc
brew cask install basictex

# quick look plugins - https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
  qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook \
  suspicious-package

# clean things up
brew cleanup
brew cask cleanup
