#Ansible_Notes

##Links

[Installation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installation-guide)
[Getting Started](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)

##Description

I will be using a blank Ubuntu 14.04 docker image locally as a test machine to install, setup, and test Ansible.  I will be bringing up 1 master docker container and multiple other slave containers that I will use to have Ansible work on them.  I will also be working on a Dockerfile that skips through the setup/configuration process in case you want to skip that and just test out Ansible scripts.

##Bring up the Docker Containers (master and slaves) -

    docker-compose -p ans_project up -d

##Configure master Container - 

Attach to ans_master:

    docker exec -it ans_master bash

Python 2.7 Install:

    apt-get update
    apt-get install python2.7 python-pip

Ansible Install:

    apt install software-properties-common
    apt-add-repository --yes ppa:ansible/ansible
    apt install ansible

Create an Inventory (edit /etc/ansible/hosts):

    apt-get install nano
    cd /etc/ansible
    nano hosts

Add the following to `hosts`:

    ans_slave0
    ans_slave1

Setup your SSH Keys:

    cd ~
    ssh-keygen -t rsa

Copy your id_rsa.pub:

    cat ~/.ssh/id_rsa.pub

##Configuring ans_slaves - 

The steps listed here will have to be done on both slaves.

Install and Configure SSH:

    docker exec -it ans_slaveX bash

    apt-get update
    apt-get install openssh-server
    service ssh restart

    cd ~
    mkdir .ssh
    cd .ssh
    apt-get install nano
    nano authorized_keys

Paste in the `id_rsa.pub` copied from `ans_master0`.
From your master container you should now be able to run `ssh ans_slaveX` and connect with no password prompt.

##Verify Ansible Connections -

Run the following commands to verify your setup:

    ansible all -m ping

    ansible all -a "/bin/echo hello"