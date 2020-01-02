# Intial Setup

## Links

[Ansible Installation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installation-guide)

[Ansible Getting Started](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)

## Description

We will be using a `ubuntu:14.04` image for the Ansible master and IBM's `ibmjava:8-jre` docker image for the slave containers.  The purpose if this environment is to have a local test environment to install, setup, and test Ansible.  We will be bringing up 1 master docker container and multiple other slave containers (2 for now) that we will use to have Ansible work on them.  We will also be working on a Dockerfile that skips through the setup/configuration process in case you want to skip that and just test out Ansible scripts.

## Bring up the Docker Containers (master and slaves) -

    docker-compose -p ans_project up -d

If you run into errors on this step make sure you have the `ubuntu:14.04` Docker images pulled, and no other containers are conflicting.

## Configure master Container - 

Attach to ans_master:

    docker exec -it ans_master bash

Python 2.7 Install:

    apt-get update
    apt-get install python2.7 python-pip

Ansible Install:

    apt install software-properties-common
    apt-add-repository --yes ppa:ansible/ansible
    apt install ansible

**(Optional)** Create an Inventory (edit `/etc/ansible/hosts`):

    apt-get install nano
    cd /etc/ansible
    nano hosts

This step is optional, because you could just use the `hosts` file I provided located: `tomcat-standalone/hosts` and point to that in later steps.

**(Optional)** Add the following to `hosts`:

    [tomcat-servers]
    ans_slave0
    ans_slave1
    ans_slave2

Setup your SSH Keys:

    cd ~
    ssh-keygen -t rsa

Just keep clicking `Enter` through this, it should put the files in `~/.ssh` and you wont need a password.

Copy your id_rsa.pub:

    cat ~/.ssh/id_rsa.pub

We'll use this public key in the next steps here.

## Configuring ans_slaves - 

The steps listed here will have to be done on **both** slaves.

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

    apt-get install python

Paste in the `id_rsa.pub` copied from `ans_master0`.
From your master container you should now be able to run `ssh ans_slaveX` and connect with no password prompt.

## Verify Ansible Connections -

Run the following commands **from the master container** to verify your setup:

    ansible all -m ping

    ansible all -a "/bin/echo hello"

You should see a successful response from both slaves (`ans_slave0` and `ans_slave1`)
