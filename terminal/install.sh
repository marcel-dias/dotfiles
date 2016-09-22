#!/bin/sh
curl -L \
  "https://raw.githubusercontent.com/mdo/ocean-terminal/master/terminal-ocean-dark.terminal" \
  > "/tmp/terminal-ocean-dark.terminal"
open "/tmp/terminal-ocean-dark.terminal"
