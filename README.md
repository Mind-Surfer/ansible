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

The container expects three parameters: -

- HOSTS
- SSH_KEY
- PLAYBOOK

### HOSTS

This is the name of the Ansible HOSTS file i.e. hosts. It should contain the details of the hosts that you wish your play book to run against. If not specified, the default name is hosts.

### SSH_KEY

The name of the private and public SSH key that will be used to authenticate to the hosts listed in your HOSTS file i.e. id_rsa. The public part of the SSH key must already configured for use on your hosts. If not specified, the default name is id_rsa.

### PLAYBOOK

This is the name of the .yml/.yaml file that you want Ansible to execute for you i.e playbook.yml. If not specified, the default is playbook.yml.

### Data Volume

This volume is the location that the image will pick up the above files from. 

### File Name and Path

You can specify the names in the above variables as a path if the file is stored in a subdirectory of the data volume i.e. /data/hosts-directory/hosts. If no path is specified, the file is assumed to be in the root of the data volume.

### Docker Run Example

`docker run --name ansible
    -d
    -it
    -e HOSTS="ansible_hosts"
    -e SSH_KEY="id_ansible_rsa"
    -e PLAYBOOK="ansible_playbook.yml"
    -v ~/ansible:/data/
    mindsurfer/ansible:latest`

### Behaviour

If the file names used in the variables are not found in the volume location, Ansible will not be executed.