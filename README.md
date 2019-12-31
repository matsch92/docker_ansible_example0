## About this Tutorial

This tutorial is structured for running a few Docker containers using `docker-compose`, running some basic Ansible commands against them, and reading Ansible documentation along the way.  The main focus here is starting from scratch with these containers on a bare bones Ubuntu installation and then doing the Ansible installation and working up to running Ansible playbooks to simulate setting up real work environments.  Utilizing Docker in this tutorial provides a disposable environment so it can be thrown away and brought back up at any point.  I'm learning about Ansible myself as I write this so the scope of this tutorial is for beginners just picking up Ansible.

## Prereqs (optional)

For this tutorial I'm expecting that you have some beginner to moderate Docker and Linux knowledge. If not this might be a good place to gain some experience with those as well.

## Expected Outcome

At the end of this tutorial you should have:
	- Ansible setup/Installtion
	- Playbook creation and usage
	- Environment with Docker Images for future testing

This tutorial does contain a specific Tomcat example, however once completed you will have the basic `master -> slave` structure setup with Docker.  So this project can also be a quick and dirty starting point for other Ansible projects that you may need to test out.
