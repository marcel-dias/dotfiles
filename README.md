# Marcel Dias' dotfiles

> My macOS preferences and configurations for ZSH, Git, Ghostty, and more.

## Install

```sh
git clone https://github.com/marcel-dias/dotfiles ~/.dotfiles
cd ~/.dotfiles
./setup
```

## What `setup` does

1. Creates symlinks for config files to their expected locations
2. Runs `brew bundle` to install packages from the Brewfile

Re-run `./setup` any time to update — it's idempotent (skips existing links).

## macOS defaults

Optionally configure macOS system preferences:

```sh
./macOS/set-defaults.sh
```

This requires `sudo` and restarts several apps. Run it manually when setting up a new machine.

## Structure

- `shell/` — ZSH configuration (zshrc, aliases, paths, functions, config, completion)
- `git/` — Git config and global gitignore → `~/.config/git/`
- `ghostty/` — Ghostty terminal config → `~/.config/ghostty/`
- `starship/` — Starship prompt config → `~/.config/starship/`
- `vscode/` — VS Code settings → `~/.vscode/`
- `node/` — Node version config → `~/.nvmrc`
- `java/` — Java version config → `~/.java-version`
- `macOS/` — macOS system defaults (manual)
- `Brewfile` — Homebrew packages, casks, Mac App Store apps, VS Code extensions

## Secrets

Private environment variables are stored in 1Password and injected into `~/.localrc` via `op inject`. Never committed to the repo.
