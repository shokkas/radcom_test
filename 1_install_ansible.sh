#!/bin/sh

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
