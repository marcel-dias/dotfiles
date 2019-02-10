#!/bin/sh
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi
antibody bundle < "$ZSH/antibody/bundles.txt" > ~/.antibody_bundles.txt
