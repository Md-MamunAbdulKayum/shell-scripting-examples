#!/bin/bash
CWD="$(dirname "$0")"
FILE_NAME="$CWD/config.properties"

function getPropVal {
    local key=$1
    local value
    value=$(grep -F "${key}=" "$FILE_NAME" | head -n 1 | cut -d'=' -f2-)
    value="${value//$'\r'/}"
    if [[ -z "$value" ]]; then
       echo "Key not found" >&2
       return 1
    fi
    echo "$value"
}

#Get the value with key
function testPropertyVal {
    local name
    name=$(getPropVal 'config.name') || exit 1
    echo "$name"
}

#Call the testPropertyVal function
testPropertyVal
