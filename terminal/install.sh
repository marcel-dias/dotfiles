#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  cp com.apple.Terminal.plist.`sw_vers | grep 'ProductVersion:' | grep -o '10\.[0-9]*'` \
    ~/Library/Preferences/com.apple.Terminal.plist \
    && defaults read com.apple.Terminal
fi
