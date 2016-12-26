#!/bin/sh
curl -L \
  "https://raw.githubusercontent.com/sindresorhus/terminal-snazzy/master/Snazzy.terminal" \
  > "/tmp/Snazzy.terminal"
open "/tmp/Snazzy.terminal"
