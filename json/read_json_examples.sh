#!/usr/bin/env bash
# Read JSON from a file: jq (preferred) and Python 3 (common on servers without jq)

set -euo pipefail

CWD="$(dirname "$0")"
JSON_FILE="$CWD/sample.json"

if [ ! -f "$JSON_FILE" ]; then
  echo "Error: missing $JSON_FILE" >&2
  exit 1
fi

read_with_jq() {
  if ! command -v jq >/dev/null 2>&1; then
    echo "jq not available; skip jq section" >&2
    return 0
  fi

  echo "=== jq: nested keys and booleans ==="
  local service health export_pdf
  service=$(jq -r '.service' "$JSON_FILE")
  health=$(jq -r '.endpoints.health' "$JSON_FILE")
  export_pdf=$(jq -r '.features.export_pdf' "$JSON_FILE")
  echo "service=$service health=$health export_pdf=$export_pdf"

  echo
  echo "=== jq: iterate endpoint map ==="
  jq -r '.endpoints | to_entries[] | "\(.key)=\(.value)"' "$JSON_FILE"
}

read_with_python() {
  if ! command -v python3 >/dev/null 2>&1; then
    echo "python3 not available; skip Python section" >&2
    return 0
  fi

  echo
  echo "=== Python 3: same fields without jq ==="
  python3 - "$JSON_FILE" <<'PY'
import json
import sys

path = sys.argv[1]
with open(path, encoding="utf-8") as f:
    data = json.load(f)

print(f"service={data['service']}")
print(f"invoices_path={data['endpoints']['invoices']}")
print(f"webhooks_enabled={data['features']['webhooks']}")
PY
}

read_json_from_curl() {
  echo
  echo "=== curl + jq: parse API JSON (commented; enable when you have a URL) ==="
  # API_URL="https://api.example.com/v1/status"
  # curl -fsS "$API_URL" | jq -r '.status'
  #
  # Fail fast on HTTP errors (-f) and show errors (-S):
  # curl -fsS -H "Accept: application/json" "$API_URL" | jq .
  echo "(See commented lines in read_json_examples.sh)"
}

read_with_jq
read_with_python
read_json_from_curl

exit 0
