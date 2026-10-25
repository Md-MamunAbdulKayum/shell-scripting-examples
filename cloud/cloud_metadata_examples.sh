#!/usr/bin/env bash
# Read cloud instance metadata from Bash (AWS, GCP, Azure)
# Useful for boot scripts: region, instance id, custom tags
#
# Placeholder IP only (RFC 5737 TEST-NET-3). On a real VM, set this to your
# provider's metadata endpoint host before running (see provider docs).

set -euo pipefail

METADATA_IP="${METADATA_IP:-203.0.113.10}"

echo "=== AWS (EC2 IMDSv2 — token then data) ==="
AWS_TOKEN=$(curl -fsS -X PUT "http://${METADATA_IP}/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" 2>/dev/null || true)
if [ -n "$AWS_TOKEN" ]; then
  AWS_DOC="http://${METADATA_IP}/latest/dynamic/instance-identity/document"
  AWS_ID_DOC=$(curl -fsS -H "X-aws-ec2-metadata-token: $AWS_TOKEN" "$AWS_DOC" 2>/dev/null || true)
  if [ -n "$AWS_ID_DOC" ] && command -v jq >/dev/null 2>&1; then
    echo "instance-id: $(echo "$AWS_ID_DOC" | jq -r '.instanceId // "n/a"')"
    echo "region: $(echo "$AWS_ID_DOC" | jq -r '.region // "n/a"')"
  elif [ -n "$AWS_ID_DOC" ]; then
    echo "$AWS_ID_DOC"
  fi
else
  echo "(not on EC2 or IMDS unavailable)"
fi

echo
echo "=== GCP (GCE metadata server) ==="
GCP_BASE="http://metadata.google.internal/computeMetadata/v1"
GCP_HDR=(-H "Metadata-Flavor: Google")
GCP_ZONE=$(curl -fsS "${GCP_HDR[@]}" "$GCP_BASE/instance/zone" 2>/dev/null || true)
if [ -n "$GCP_ZONE" ]; then
  echo "zone: $GCP_ZONE"
  echo "project: $(curl -fsS "${GCP_HDR[@]}" "$GCP_BASE/project/project-id" 2>/dev/null || true)"
else
  echo "(not on GCE or metadata unavailable)"
fi

echo
echo "=== Azure (IMDS) ==="
AZ_JSON=$(curl -fsS --connect-timeout 2 --max-time 3 \
  -H "Metadata: true" \
  "http://${METADATA_IP}/metadata/instance?api-version=2021-02-01" 2>/dev/null || true)
if [ -n "$AZ_JSON" ] && command -v jq >/dev/null 2>&1; then
  echo "vm name: $(echo "$AZ_JSON" | jq -r '.compute.name // "n/a"')"
  echo "location: $(echo "$AZ_JSON" | jq -r '.compute.location // "n/a"')"
elif [ -n "$AZ_JSON" ]; then
  echo "$AZ_JSON"
else
  echo "(not on Azure VM or IMDS unavailable)"
fi

exit 0
