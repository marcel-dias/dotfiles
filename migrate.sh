#!/bin/bash
# Removes old symlinks from the holman-style dotfiles setup.
# Run this ONCE before running ./setup to switch to the new structure.
#
# Usage: ./migrate.sh

set -euo pipefail

removed=0

remove_link() {
  local target="$1"
  if [ -L "$target" ]; then
    echo "  Removed symlink: $target → $(readlink "$target")"
    rm "$target"
    removed=$((removed + 1))
  elif [ -e "$target" ]; then
    echo "  SKIP: $target exists but is not a symlink (manual review needed)"
  fi
}

echo "Removing old dotfiles symlinks..."
echo ""

# Shell
remove_link ~/.zshrc

# Git (old: ~/.gitconfig, ~/.gitignore — now goes to ~/.config/git/)
remove_link ~/.gitconfig
remove_link ~/.gitignore

# Ghostty (old: ~/.ghosthy/ — note the typo in old dir name)
remove_link ~/.ghosthy

# Starship (old: ~/.starship/ — now goes to ~/.config/starship/)
remove_link ~/.starship

# VS Code (old: ~/.vscode was symlinked to vscode.symlink/)
remove_link ~/.vscode

# Node
remove_link ~/.nvmrc
remove_link ~/.npmrc

# Java
remove_link ~/.java-version

# Editorconfig
remove_link ~/.editorconfig

echo ""
echo "Removed $removed symlink(s)."
echo ""
echo "Now run: ./setup"
