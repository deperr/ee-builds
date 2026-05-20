#!/bin/bash

echo "=== Ansible Builder Token Setup ==="

# Check if the Certified token is empty
if [ -z "$ANSIBLE_GALAXY_SERVER_CERTIFIED_TOKEN" ]; then
  read -s -p "Paste your CERTIFIED token: " cert_token
  echo "" # Prints a new line after the silent input
  export ANSIBLE_GALAXY_SERVER_CERTIFIED_TOKEN="$cert_token"
else
  echo "✅ CERTIFIED token is already set."
fi

# Check if the Validated token is empty
if [ -z "$ANSIBLE_GALAXY_SERVER_VALIDATED_TOKEN" ]; then
  read -s -p "Paste your VALIDATED token: " val_token
  echo "" 
  export ANSIBLE_GALAXY_SERVER_VALIDATED_TOKEN="$val_token"
else
  echo "VALIDATED token is already set."
fi

echo "==================================="
# Print a quick verification (only showing the first 10 characters for security)
echo "Current Certified Token starts with: ${ANSIBLE_GALAXY_SERVER_CERTIFIED_TOKEN:0:10}..."
echo "Current Validated Token starts with: ${ANSIBLE_GALAXY_SERVER_VALIDATED_TOKEN:0:10}..."