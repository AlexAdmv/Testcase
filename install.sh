#!/bin/bash
if ! rpm -qa | grep -qw ansible; then
	sudo yum install -y epel-release
	sudo yum install -y ansible
	sudo yum install -y jq
fi	

ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id.rsa
sudo chmod -R 755 /home/vagrant/.ssh
sshpass -p vagrant ssh-copy-id -o StrictHostKeyChecking=no vagrant@192.168.10.5
sshpass -p vagrant ssh-copy-id -o StrictHostKeyChecking=no vagrant@192.168.10.6
sshpass -p vagrant ssh-copy-id -o StrictHostKeyChecking=no vagrant@192.168.10.7

ansible-playbook -i /vagrant/hosts /vagrant/site.yml