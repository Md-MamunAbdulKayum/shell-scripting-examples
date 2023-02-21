#!/bin/bash
#############################################################
# @Mamun Kayum                                              #
#                                                           #
#############################################################

# Set the URL of the authentication endpoint
AUTH_URL="https://example.com/auth"

# Set the credentials to use for authentication
USERNAME="user"
PASSWORD="pass"

# Use curl to authenticate and obtain a token
TOKEN=$(curl -s -X POST -H "Content-Type: application/json" -d '{"username": "'"$USERNAME"'", "password": "'"$PASSWORD"'"}' $AUTH_URL | jq -r '.token')

# Check if the token was obtained successfully
if [ -z "$TOKEN" ]; then
    echo "Failed to obtain authentication token"
    exit 1
fi

# Set the URL of the resource to access
RESOURCE_URL="https://example.com/resource"

# Use curl with the token to access the resource
curl -s -H "Authorization: Bearer $TOKEN" $RESOURCE_URL
