# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

WORKSPACE = 'C:\Projetos'
MEMORY = '512'

Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  
  config.vm.synced_folder WORKSPACE, "/home/vagrant/projetos"
  
  # rails
  config.vm.network :forwarded_port, host: 3000, guest: 3000
  config.vm.network :forwarded_port, host: 3001, guest: 3001
  config.vm.network :forwarded_port, host: 9292, guest: 9292
  config.vm.network :forwarded_port, host: 9293, guest: 9293
  # rabbitmq
  config.vm.network :forwarded_port, host: 5672, guest: 5672
  # rabbitmq management
  config.vm.network :forwarded_port, host: 15672, guest: 15672

  config.vm.provider "virtualbox" do |vb|
      vb.memory = MEMORY
  end
	config.vm.provision "shell", path: "provision.sh", privileged: false
end