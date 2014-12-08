

## Vagrant Commands

	vagrant init
	vagrant up
	vagrant destroy -f
	
	vagrant ssh

## Vagrant Networking

	Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
		config.vm.network "private_network", ip: "192.168.50.4"
	end

This will 

1. Create a **host-only network** adapter for `virtualbox` with ip address `192.168.50.1`
2. Apply this host-only network adapter to the newly created box
3. Assign static ip address `192.168.50.4` to the box
