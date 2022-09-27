#!/bin/sh

# Generate SSH host keys
INIT_FILE=/initialized
# if first time
if [ ! -f "$INIT_FILE" ]; then
  echo "Generating SSH host keys..."
  ssh-keygen -A
  echo "1" > $INIT_FILE
fi

# Start the OpenSSH server:
/usr/sbin/sshd -D -e