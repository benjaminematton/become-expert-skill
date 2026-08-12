#!/bin/bash
# Deploy this repo (the source of truth) to the three Claude config dirs.
# Cursor -> ~/.claude-work, VS Code -> ~/.claude-personal, terminal -> ~/.claude.
# Copies SKILL.md + references/ + scripts/ (the landing gate); leaves anything else in
# place. Run after committing.
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
for d in "$HOME/.claude" "$HOME/.claude-work" "$HOME/.claude-personal"; do
  dest="$d/skills/become-expert"
  mkdir -p "$dest"
  cp -R "$SRC/SKILL.md" "$SRC/references" "$SRC/scripts" "$dest/"
  find "$dest/scripts" -name __pycache__ -type d -exec rm -rf {} + 2>/dev/null || true
  echo "deployed -> $dest"
done
echo "done. verify: diff <(cat SKILL.md) ~/.claude/skills/become-expert/SKILL.md"
