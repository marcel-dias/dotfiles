#!/usr/bin/env bash
# Claude Code PreToolUse hook — rewrite `git commit` to `gcm`.
#
# `gcm` (see ~/.dotfiles/bin/gcm) is the signed/signed-off commit command. This
# hook transparently rewrites any `git commit ...` into `gcm ...` so commits made
# by Claude are always signed, using the same command the user maintains by hand.
#
# Symlinked into ~/.claude/hooks and ~/.claude-personal/hooks (see dotfiles `setup`).
# Requires: jq
set -euo pipefail

if ! command -v jq &>/dev/null; then
  echo "[gcm-rewrite] WARNING: jq is not installed; cannot rewrite commits." >&2
  exit 0
fi

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

[ -z "$CMD" ] && exit 0

# Only act on a real `git commit` subcommand (not `git commit-tree`, etc.).
echo "$CMD" | grep -Eq '(^|[[:space:]])git[[:space:]]+commit([[:space:]]|$)' || exit 0

# Replace the first `git commit` token with `gcm`. The gcm script re-adds
# -s -S and passes any remaining flags (-m, --amend, ...) straight through.
REWRITTEN=$(echo "$CMD" | sed -E 's/(^|[[:space:]])git[[:space:]]+commit/\1gcm/')

[ "$CMD" = "$REWRITTEN" ] && exit 0

UPDATED_INPUT=$(echo "$INPUT" | jq -c --arg cmd "$REWRITTEN" '.tool_input | .command = $cmd')

jq -n --argjson updated "$UPDATED_INPUT" \
  '{
    "hookSpecificOutput": {
      "hookEventName": "PreToolUse",
      "permissionDecision": "allow",
      "permissionDecisionReason": "Rewrote `git commit` to `gcm` (signed commit)",
      "updatedInput": $updated
    }
  }'
