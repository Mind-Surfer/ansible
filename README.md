# Ansible

This is a Docker container of Ansible that will execute a play book against a defined set of hosts or host.

## Baseimage

The container's base image is alpine.

## Tags

The supported tags are: -

- v1.00
- latest

The tag latest is an identicle copy of the most recent stable version.

## Package and Security Updates

The image is updated with the latest package and security once per week. Please note that only the supported tags will receive the updates.

----

## Usage

The container expects a volume (data) and three parameters: -

- INVENTORY
- SSH_KEY
- PLAYBOOK

These parameters map to locations within the the data volume.

### INVENTORY

This is the file path and file name of the Ansible inventory/hosts file i.e. /data/inventory. It should contain the details of the hosts that you wish your play book to run against. If not specified, the default value is /data/inventory.

### SSH_KEY

The directory path of the private and public SSH key that will be used to authenticate to the hosts listed in your HOSTS file. The public part of the SSH key must already configured for use on your hosts. If not specified, the default value is /data/ssh.

### PLAYBOOK

This is the file path and file name of the .yml/.yaml file that you want Ansible to execute for you i.e playbook.yml. If not specified, the default value is /data/playbook.yml.

### Docker Run Example

`docker run --name ansible
    -it
    -e INVENTORY="/data/ansible_inventory"
    -e SSH_KEY="/data/ssh/"
    -e PLAYBOOK="/data/ansible_playbook.yml"
    -v ~/ansible:/data/
    mindsurfer/ansible:latest`

## Found a Bug Or Have a Suggestion?

If you've found a bug or have suggestion that can improve this image, let us know by logging it [here](https://github.com/Mind-Surfer/ansible/issues/new/choose).

## Donations

If you appreciate my work, buy me coffee! :smile:

<a href="https://www.buymeacoffee.com/mindsurfer" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height= "60" width="217" ></a>
