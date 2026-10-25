#!/bin/bash

CWD="$(dirname "$0")"

# shellcheck source=perform_db_operation.sh
. "$CWD/perform_db_operation.sh"

# Call runQuery; capture one row per line (command substitution is a string, not an array)
while IFS= read -r table; do
   echo "$table"
done < <(runQuery "show tables")

# Get all the rows from a table
while IFS= read -r val; do
   echo "$val"
done < <(runQuery "select * from account")