#!/bin/sh

# Check if the parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <new_last_two_digits>"
  exit 1
fi

# Validate the parameter is within the range 1-255
if [ "$1" -lt 1 ] || [ "$1" -gt 255 ]; then
  echo "Error: The value must be between 1 and 255."
  exit 1
fi

# Define the new IP address
NEW_IP="10.212.130.$1"

# Backup the original /etc/hosts file
cp /etc/hosts /etc/hosts.bak

# Use sed to replace the IP address
sed -i.bak "s/10\.212\.130\.[0-9]\{1,3\} local\.ext30\.wsb\.pl/$NEW_IP local.ext30.wsb.pl/" /etc/hosts

echo "IP address updated to $NEW_IP in /etc/hosts"
