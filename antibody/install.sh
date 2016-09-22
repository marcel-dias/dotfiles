#!/bin/sh
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi
antibody bundle < "$ZSH/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$ZSH/antibody/bundle_zsh.txt" >> ~/.bundles.txt
