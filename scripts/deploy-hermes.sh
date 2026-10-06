#!/usr/bin/env bash
# Build the Hermes copy of every skill from the committed HEAD and install it on the VPS.
# Each SKILL.md gets its frontmatter from hermes/<name>.yaml; only SKILL.md and
# references/ ship. Existing copies are backed up on the VPS first, then every skill is linted.
set -euo pipefail
repo="$(cd "$(dirname "$0")/.." && pwd)"
host="${HERMES_HOST:-hermes-vps}"
category="${HERMES_CATEGORY:-creative}"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT

git -C "$repo" archive HEAD | tar -x -C "$stage"
out="$stage/out"; mkdir -p "$out"
names=()
for dir in "$stage"/skills/*/; do
  name="$(basename "$dir")"
  fm="$stage/hermes/$name.yaml"
  [ -f "$fm" ] || { echo "missing hermes/$name.yaml" >&2; exit 1; }
  mkdir -p "$out/$name"
  { echo '---'; cat "$fm"; echo '---'
    awk 'BEGIN{n=0} n>=2{print; next} /^---[[:space:]]*$/{n++}' "$dir/SKILL.md"; } > "$out/$name/SKILL.md"
  [ -d "$dir/references" ] && cp -R "$dir/references" "$out/$name/"
  names+=("$name")
done

stamp="$(date +%Y%m%d-%H%M%S)"
ssh "$host" "cd ~/.hermes/skills/$category && existing=\$(ls -d ${names[*]} 2>/dev/null || true) && \
  if [ -n \"\$existing\" ]; then tar -czf ~/my-humanize.bak-$stamp.tgz \$existing && rm -rf \$existing; fi"
COPYFILE_DISABLE=1 tar --no-xattrs -C "$out" -czf - "${names[@]}" \
  | ssh "$host" "tar --no-same-owner -C ~/.hermes/skills/$category -xzf -"

ssh "$host" "cd /root/.hermes/hermes-agent && venv/bin/python3 - ${names[*]}" <<PY
import sys
from tools.skill_linter import lint_skill
bad = 0
for name in sys.argv[1:]:
    findings = lint_skill("/root/.hermes/skills/$category/%s/SKILL.md" % name)
    print(name, "clean" if not findings else "")
    for f in findings:
        print("   ", f.severity, f.rule, f.message)
        bad += str(f.severity).lower().endswith("error")
sys.exit(1 if bad else 0)
PY
echo "deployed ${names[*]} to $host:~/.hermes/skills/$category (backup if replaced: ~/my-humanize.bak-$stamp.tgz)"
