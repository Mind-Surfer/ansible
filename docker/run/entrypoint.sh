#!/bin/sh
echo "Using ssh file $SSH_KEY"
echo "Using inventory file: $INVENTORY"
echo "Using playbook file: $PLAYBOOK"

if [ -d ~/.ssh ]; then
 #Get rid of whatever was there previously
 rm -r ~/.ssh 
fi
mkdir -p ~/.ssh
#Copy the new one in
cp -r $SSH_KEY/* ~/.ssh
ls -a ~/.ssh

#Reset the permissions (got this command from https://superuser.com/questions/215504/permissions-on-private-key-in-ssh-folder)
#find .ssh/ -type f -exec chmod 600 {} \;; find .ssh/ -type d -exec chmod 700 {} \;; find .ssh/ -type f -name "*.pub" -exec chmod 644 {} \;
#Run the playbook
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook $PLAYBOOK -i $INVENTORY