#!/bin/sh

function install_ansible_galaxy_prereqs () {

	echo
	echo 'installing ansible roles from galaxy'
	echo 'installing docker role'
	ansible-galaxy install --roles-path=/etc/ansible/roles/ nickjj.docker
}

# Main
returnVal = 0

# updating packages
echo
echo 'updating packages'
sudo apt update
sudo apt install software-properties-common

# get the Ansible package and update
echo
echo 'adding ansible package'
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update

# install Ansible
echo
echo 'installing ansible'
sudo apt -y install ansible

echo 'verify ansible installation'
ansible --version


echo
if [ $? -eq 0 ] 
then
	echo '*** Ansible installed successfuly ***'
	
	install_ansible_galaxy_prereqs
	
	ansible-playbook localhost -K playbook.yml
	
else
	echo '=== Error installing Ansible. Please review log/output ==='
	returnVal = $?
fi

exit $returnVal


