#!/usr/bin/env bash
# jq examples: parse, filter, transform, and build JSON (requires jq on PATH)

set -euo pipefail

CWD="$(dirname "$0")"
JSON_FILE="$CWD/sample.json"

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: jq is not installed. See https://jqlang.org/" >&2
  exit 1
fi

if [ ! -f "$JSON_FILE" ]; then
  echo "Error: missing $JSON_FILE" >&2
  exit 1
fi

echo "=== Scalar fields ==="
echo "app: $(jq -r '.app' "$JSON_FILE")"
echo "region: $(jq -r '.config.region' "$JSON_FILE")"
echo "retries: $(jq -r '.config.retries' "$JSON_FILE")"

echo
echo "=== Array: all user names ==="
jq -r '.users[].name' "$JSON_FILE"

echo
echo "=== Filter: active users only ==="
jq -r '.users[] | select(.active == true) | "\(.name) (\(.role))"' "$JSON_FILE"

echo
echo "=== Map to compact objects ==="
jq -c '.users[] | {user: .name, is_admin: (.role == "admin")}' "$JSON_FILE"

echo
echo "=== Length and keys ==="
echo "user count: $(jq '.users | length' "$JSON_FILE")"
echo "top-level keys: $(jq -r 'keys | join(", ")' "$JSON_FILE")"

echo
echo "=== Default when key is missing ==="
echo "timeout: $(jq -r '.config.timeout // "not set"' "$JSON_FILE")"

echo
echo "=== Build JSON from shell variables ==="
NAME="Olive"
ROLE="admin"
jq -n --arg name "$NAME" --arg role "$ROLE" \
  '{name: $name, role: $role, created: (now | strftime("%Y-%m-%d"))}'

echo
echo "=== Merge / update (non-destructive; prints to stdout) ==="
jq '.config.retries = 5 | .config.environment = "dev"' "$JSON_FILE"

exit 0
