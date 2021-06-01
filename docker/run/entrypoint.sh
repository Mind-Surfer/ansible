#!/bin/sh
for arg in "$@"
do
index=$(echo $arg | cut -f1 -d=)
val=$(echo $arg | cut -f2 -d=)
case $index in
ssh) ssh_file=$val;;

hosts) hosts=$val;;

playbook) playbook=$val;;

*)
esac
done

if [[ -f $hosts && -f $playbook && ! -z "$ssh_file" && ! -z "$hosts" && ! -z "$playbook" ]]; then
 echo "Using ssh file $ssh_file"
 echo "Using hosts file: $hosts"
 echo "Using playbook file: $playbook"
 #Get rid of whatever was there previously
 rm -r ~/.ssh
 mkdir -p ~/.ssh
 #Copy the new onw in
 cp $ssh_file ~/.ssh
 #Reset the permissions (got this command from https://superuser.com/questions/215504/permissions-on-private-key-in-ssh-folder)
 find .ssh/ -type f -exec chmod 600 {} \;; find .ssh/ -type d -exec chmod 700 {} \;; find .ssh/ -type f -name "*.pub" -exec chmod 644 {} \;
 #Run the playbook
 ansible-playbook $playbook -i $hosts

elif [[ ! -d $ssh_file || -z "$ssh_file" ]]; then
 echo "Could not find ssh file! Exiting.." && exit 1

elif [[ ! -f $hosts || -z "$hosts" ]]; then
 echo "Could not find hosts file! Exiting.." && exit 1

elif [[ ! -f $playbook || -z "$playbook" ]]; then
 echo "Could not find playbook! Exiting.." && exit 1

fi