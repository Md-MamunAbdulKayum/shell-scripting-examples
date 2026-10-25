#!/usr/bin/env bash
# Create JSON payloads in scripts (heredoc, env vars) and validate with jq

set -euo pipefail

CWD="$(dirname "$0")"
OUT_FILE="$CWD/generated_payload.json"

USER_ID="${USER_ID:-1001}"
PLAN="${PLAN:-pro}"

# Heredoc: static structure, shell expands variables
cat >"$OUT_FILE" <<EOF
{
  "user_id": $USER_ID,
  "plan": "$PLAN",
  "notify": true
}
EOF

echo "Wrote $OUT_FILE"

if command -v jq >/dev/null 2>&1; then
  echo "Valid JSON: $(jq -e . "$OUT_FILE" >/dev/null && echo yes || echo no)"
  echo "Compact: $(jq -c . "$OUT_FILE")"
else
  echo "Install jq to validate and pretty-print JSON"
fi

# Safer for untrusted strings: build with jq --arg (escapes quotes/newlines)
if command -v jq >/dev/null 2>&1; then
  NOTE='Say "hello" and newline safe'
  jq -n --argjson uid "$USER_ID" --arg plan "$PLAN" --arg note "$NOTE" \
    '{user_id: $uid, plan: $plan, note: $note}' >"$CWD/safe_payload.json"
  echo "Safe payload: $(cat "$CWD/safe_payload.json")"
fi

exit 0
