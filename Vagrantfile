Vagrant.configure("2") do |config|

  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

	##################################_app1_##################################	
	config.vm.define "app1" do |app1|	
		app1.vm.box = "centos/7"
		app1.vm.hostname = 'app1'
	
		app1.vm.network "private_network", ip: "192.168.10.5"
	
		app1.vm.provider "virtualbox" do |v|
			v.customize ["modifyvm", :id, "--memory", 512]
			v.customize ["modifyvm", :id, "--name", "app1"]
		end
		
		app1.vm.provision "shell", inline: <<-SHELL
		
            sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
            sudo systemctl restart sshd

		SHELL
				
	end

	##################################_app2_##################################	
	config.vm.define "app2" do |app2|	
		app2.vm.box = "centos/7"
		app2.vm.hostname = 'app2'
	
		app2.vm.network "private_network", ip: "192.168.10.7"
	
		app2.vm.provider "virtualbox" do |v|
			v.customize ["modifyvm", :id, "--memory", 512]
			v.customize ["modifyvm", :id, "--name", "app2"]
		end
		
		app2.vm.provision "shell", inline: <<-SHELL
		
            sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
            sudo systemctl restart sshd

		SHELL
				
	end	
	
		
	##################################_monitoring_##################################	
	config.vm.define "monitoring" do |monitoring|	
		monitoring.vm.box = "centos/7"
		monitoring.vm.hostname = 'monitoring'
	
		monitoring.vm.network "private_network", ip: "192.168.10.6"
	
		monitoring.vm.provider "virtualbox" do |v|
			v.customize ["modifyvm", :id, "--memory", 512]
			v.customize ["modifyvm", :id, "--name", "monitoring"]
		end
		
        monitoring.vm.provision "shell", inline: <<-SHELL
		
            sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
            sudo systemctl restart sshd


		SHELL
				
	end
	
	##################################_ansible_##################################	
	config.vm.define "ansible" do |ansible|	
		ansible.vm.box = "centos/7"
		ansible.vm.hostname = 'ansible'
	
		ansible.vm.network "private_network", ip: "192.168.10.10"
	
		ansible.vm.provider "virtualbox" do |v|
			v.customize ["modifyvm", :id, "--memory", 512]
			v.customize ["modifyvm", :id, "--name", "ansible"]
		end
		
		config.vm.provision "shell", path: "install.sh", privileged: false
		config.vm.provision "shell", path: "post.sh", privileged: false
			
	  end
				
	end