# Running Playbooks

## Links

[Root of the Playbook Documentation](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html#working-with-playbooks)

Some important ones:

[Introduction](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html)

[Variables](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html)

[Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)

Offical Ansible Example:

[Offical Ansible Tomcat Example](https://github.com/ansible/ansible-examples/tree/master/tomcat-standalone)

## Description

In this step we'll go through the first steps required to run a playbook.  Take a look at the directory/file structure I have setup for the `tomcat-standalone` project.  

## Where we're at

So now that we've finished `0_setup.md` you should have 3 containers running and configured with all of the necessary dependencies installed:

- The "master" container which will act as our Ansible controller
- 2 "slave" containers which will act as our tomcat servers that we'll run our playbooks against

## Edit the Variables

I've purposefully put the `tomcat-standalone/roles/tomcat/vars/tomcat-servers` file in the `.gitignore` because our variables may be different.  You will need to edit these variables in order for your playbook to run successfully.

Variables to edit:
- **tar_url**: change this to your tomcat version url

## Copy the Tomcat Playbook into our master container

Since the `master` container will act as our controller, we want to get our playbooks into it.  Run the following command (from outside of the container on your local machine) to copy the playbooks into the master container.

	docker cp tomcat-standalone/ ans_master:/root/

## Run the Tomcat Playbook

Go into your master container and run the playbook:

	docker exec -it ans_master bash
	cd ~/tomcat-standalone
	ansible-playbook -i hosts site.yml

Parameters:
- **-i hosts**: selects the hosts file in your current directory, if you didn't use this it would select Ansible's default hosts file in `/etc/ansible/hosts` 
- **site.yaml**: this selects our playbok to run which goes through our directory structure, finds the `tomcat` role and runs the tasks under that role

## Verify it ran successfully

For verification you can go into each of the slave containers and check the following:

	docker exec -it ans_slaveX bash
	cd ~/

- There is 1 directory and a symlink: `apache-tomcat-<version>` and `tomcat` (respectively)
- `cd tomcat` all of the files are extracted

## Future Enhancements

[ ] Check if tomcat is there:
- if it exists: verify the configuration
- if it does not exist: run setup and configure

[ ] Implement Templates for Tomcat configuration files

[ ] Implement runtime checks using the `service` module