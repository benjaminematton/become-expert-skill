#!/bin/bash
# Deploy this repo (the source of truth) to the three Claude config dirs.
# Cursor -> ~/.claude-work, VS Code -> ~/.claude-personal, terminal -> ~/.claude.
# Copies SKILL.md + references/ only; leaves anything else in place. Run after committing.
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
for d in "$HOME/.claude" "$HOME/.claude-work" "$HOME/.claude-personal"; do
  dest="$d/skills/become-expert"
  mkdir -p "$dest"
  cp -R "$SRC/SKILL.md" "$SRC/references" "$dest/"
  echo "deployed -> $dest"
done
echo "done. verify: diff <(cat SKILL.md) ~/.claude/skills/become-expert/SKILL.md"
