# Yonde Test Task

## Usage

Requires Vagrant, VirtualBox and 2GB free RAM

### VirtualBox 5.2.x is not supported for Vagrant 2.0.0! (Guest Additions problem)  
Install *once* a Vagrant plugin which automatically installs the host's VirtualBox Guest Additions on the guest system.
```bash
$ vagrant plugin install vagrant-vbguest
```
Run a Vagrantfile
```bash
$ vagrant up
```

## Description

Vagrant create 4 instances with CentOS 7: *app1*, *app2*, *monitoring* and *ansible*.  
Ansible install on node *ansible* using Vagrant shell provisioner.  
All another provisioning proceed with Ansible.  

* 192.168.10.5 - Application node 1  
* 192.168.10.7 - Application node 2  
* 192.168.10.6 - Grafana dashboard  
* 192.168.10.10 - Ansible Host  

Deafault Grafana credentials - *admin*/*admin*  

Used software:  Vagrant 2.0.1, Oracle VM VirtualBox 5.2.2  

Tested on Windows 10 1709 x64  


