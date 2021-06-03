#!/bin/sh
set -e

echo "Using ssh directory: $SSH_KEY"
echo "Using inventory file: $INVENTORY"
echo "Using playbook file: $PLAYBOOK"

if [ -d ~/.ssh ]; then
 #Get rid of whatever was there previously
 rm -r ~/.ssh 
fi
mkdir -p ~/.ssh
#Copy the new one in
cp -r $SSH_KEY/* ~/.ssh

exec "$@"