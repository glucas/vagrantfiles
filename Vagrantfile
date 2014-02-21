# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

## Sample vagrant/vbox configuration

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # fetch base image
  config.vm.box = "precise64-cloudimg"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # set up network
  config.vm.hostname = "my-hostname"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.ssh.forward_agent = true

  # share folders
  config.vm.synced_folder "/shared", "/host/shared"
  config.vm.synced_folder "/home/source/vagrantfiles/scripts", "/host/provision"
  
  # provision
  config.vm.provision :shell, :path => "provision.sh"

  # configure vbox image
  config.vm.provider :virtualbox do |vb|
    vb.name = "my-vm-name"
    vb.customize ["modifyvm", :id, "--groups", "/Vagrant/MyGroup"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    # vb.customize ["modifyvm", :id, "--vram", "32"]
    # vb.gui = true
  end

end
