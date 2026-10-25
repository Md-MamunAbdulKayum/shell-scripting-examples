#!/usr/bin/env bash
if [ $# -lt 1 ] || [ ! -f "$1" ]; then
  echo "Usage: $0 <file>" >&2
  exit 1
fi

COUNT=1
SCRIPT_DIR="$(dirname "$0")"
OUTPUT_FILE="$SCRIPT_DIR/output.txt"
: > "$OUTPUT_FILE"
#Internal Field Separator (IFS) that is used for word splitting 
#after expansion and to split lines into words with the read builtin command
while IFS='' read -r LINE
do
  echo "LINE $COUNT: $LINE" >> "$OUTPUT_FILE"
  ((COUNT++))
#$1 gets the file passed a parameter while running the script
done < "$1"

exit 0
