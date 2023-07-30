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

# Build the JSON payload using jq
PAYLOAD=$(jq --null-input \
  --arg username "$USERNAME" \
  --arg password "$PASSWORD" \
  '{ "username": $username, "password": $password }')

# Use curl to authenticate and obtain a token
TOKEN=$(curl -s -X POST -H "Content-Type: application/json" -d "$PAYLOAD" "$AUTH_URL" | jq -r '.token')

# Check if the token was obtained successfully
if [ -z "$TOKEN" ]; then
    echo "Failed to obtain authentication token"
    exit 1
fi

# Set the URL of the resource to access
RESOURCE_URL="https://example.com/resource"

# Use curl with the token to access the resource
curl -s -H "Authorization: Bearer $TOKEN" "$RESOURCE_URL"
