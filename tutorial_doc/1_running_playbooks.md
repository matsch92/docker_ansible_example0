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
-

## Copy the Tomcat Playbook into our master container

Since the `master` container will act as our controller, we want to get our playbooks into it.  Run the following command (from outside of the container on your local machine) to copy the playbooks into the master container.

	docker cp tomcat-standalone/ ans_master:/root/