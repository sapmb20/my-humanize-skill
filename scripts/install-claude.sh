#!/usr/bin/env bash
# Link every skill in skills/ into ~/.claude/skills so Claude Code discovers it.
set -euo pipefail
repo="$(cd "$(dirname "$0")/.." && pwd)"
dest="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$dest"
for dir in "$repo"/skills/*/; do
  name="$(basename "$dir")"
  target="$dest/$name"
  if [ -L "$target" ]; then
    ln -sfn "${dir%/}" "$target"
  elif [ -e "$target" ]; then
    echo "skip $name: $target exists and is not a symlink" >&2
    continue
  else
    ln -s "${dir%/}" "$target"
  fi
  echo "linked $name -> ${dir%/}"
done
