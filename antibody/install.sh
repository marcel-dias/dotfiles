#!/bin/sh
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi
antibody bundle < "$ZSH/antibody/bundles.txt" > ~/.antibody_bundles.txt
antibody bundle sindresorhus/pure >> ~/.antibody_bundles.txt
antibody bundle < "$ZSH/antibody/bundle_zsh.txt" >> ~/.antibody_bundles.txt
