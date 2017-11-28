# Yonde Test Task

## Usage

Requires Vagrant, VirtualBox and 2GB free RAM

### Vagrant ≥ 1.1
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
Ansible install on node *ansible* using Vagrant shell provision.  
All another provisioning proceed with Ansible.  

* 192.168.10.5 - application node 1  
* 192.168.10.7 - application node 2  
* 192.168.10.6 - grafana dashboard  

Deafault Grafana credentials - *admin*/*admin*  

Used software:  Vagrant 2.0.1, Oracle VM VirtualBox 5.2.2  

Tested on Windows 10 1709 x64  


