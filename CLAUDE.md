# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Dotfiles for macOS/ZSH. Simple explicit setup — a single `setup` script symlinks config files to their expected locations and runs `brew bundle`.

## Key Commands

```bash
./setup                        # Link configs + brew bundle (idempotent, safe to re-run)
./macOS/set-defaults.sh        # macOS system preferences (manual, requires sudo)
shellcheck <file>              # Lint shell scripts
```

## Structure

- `setup` — single entry point with explicit `link()` calls, no auto-discovery
- `shell/` — all ZSH config grouped by purpose (zshrc, aliases, paths, functions, config, completion)
- `shell/zshrc` — entry point symlinked to `~/.zshrc`, sources other shell files explicitly
- App configs (`git/`, `ghostty/`, `starship/`) use XDG `~/.config/` paths
- `vscode/settings.json` links to `~/.vscode/settings.json`
- `Brewfile` is the source of truth for packages

## Conventions

- Indent with 2 spaces, LF line endings, UTF-8 (see `.editorconfig`)
- Shell scripts should pass `shellcheck`
- To add a new app config: create a directory, add the config file, add a `link()` call in `setup`
- Secrets live in 1Password (`op inject` populates `~/.localrc`), never in the repo
- Commits are signed via SSH keys through 1Password
