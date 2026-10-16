#!/usr/bin/env sh
# Install OpenAccountants AI skills (tax rules your AI follows) into an agent's skills folder.
#
#   curl -fsSL https://raw.githubusercontent.com/openaccountants/openaccountants/main/agent-skills/install.sh | sh -s -- MT NL
#   curl -fsSL .../install.sh | sh -s -- GB --to ~/.hermes/skills
#   curl -fsSL .../install.sh | sh -s -- all --to ./.claude/skills
#
# Arguments: country codes (MT NL DE IE GB US ...), a slug (malta-vat-return), or "all".
# Target: --to <dir>, else the first of ~/.claude/skills, ~/.codex/skills, ~/.hermes/skills that exists,
# else ~/.claude/skills is created. Each skill is one folder with a SKILL.md; re-run to update.
# Nothing else is touched. No telemetry. Skills say where today's figures live (the connector).
set -eu

RAW="${OA_SKILLS_RAW:-https://raw.githubusercontent.com/openaccountants/openaccountants/main/agent-skills}"
TARGET=""
WANT=""
while [ $# -gt 0 ]; do
  case "$1" in
    --to) TARGET="$2"; shift 2 ;;
    -h|--help) sed -n '2,12p' "$0"; exit 0 ;;
    *) WANT="$WANT $1"; shift ;;
  esac
done
[ -n "$WANT" ] || { echo "usage: install.sh <COUNTRY|slug|all> ... [--to DIR]" >&2; exit 2; }

if [ -z "$TARGET" ]; then
  for d in "$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.hermes/skills"; do
    if [ -d "$d" ]; then TARGET="$d"; break; fi
  done
  [ -n "$TARGET" ] || TARGET="$HOME/.claude/skills"
fi
mkdir -p "$TARGET"

INDEX="$(mktemp)"
trap 'rm -f "$INDEX"' EXIT
curl -fsSL "$RAW/index.json" -o "$INDEX"

# pick slugs: by jurisdiction prefix (MT matches MT and MT-*), by exact slug, or all
SLUGS="$(python3 - "$INDEX" $WANT <<'PY'
import json, sys
index = json.load(open(sys.argv[1]))
want = [w.upper() for w in sys.argv[2:]]
out = []
for s in index["skills"]:
    j = (s.get("jurisdiction") or "").upper()
    cc = j.split("-")[0]
    if "ALL" in want or s["name"].upper() in want or j in want or cc in want:
        out.append(s["name"])
print("\n".join(out))
PY
)"
[ -n "$SLUGS" ] || { echo "no skills matched: $WANT" >&2; exit 1; }

n=0
for slug in $SLUGS; do
  mkdir -p "$TARGET/$slug"
  if curl -fsSL "$RAW/$slug/SKILL.md" -o "$TARGET/$slug/SKILL.md"; then n=$((n+1)); else echo "skip $slug (download failed)" >&2; fi
done
echo "installed $n OpenAccountants skills into $TARGET"
echo "For today's figures, add the connector too: https://www.openaccountants.com/connect"
