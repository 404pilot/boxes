## Environmental Variable

Export environmental variable to `/etc/profile`, since when `vagrant up` tries to initialize virtual
box, it uses `ubuntu` user not `vagrant` user. But `vagrant ssh` will use `vagrant` user.

Try `ls /home/` to prove it.

	vagrant@vagrant-ubuntu-trusty-64:~$ ls /home/
	ubuntu  vagrant

But sometimes (for example install `rvm`)

	==> default: gpg:
	==> default: directory `/root/.gnupg' created
	==> default: gpg:
	==> default: new configuration file `/root/.gnupg/gpg.conf' created
	==> default: gpg:
	==> default: WARNING: options in `/root/.gnupg/gpg.conf' are not yet active during this run
	==> default: gpg:
	==> default: keyring `/root/.gnupg/pubring.gpg' created
	==> default: gpg:
	==> default: Signature made Sun 04 Jan 2015 11:47:58 PM UTC using RSA key ID BF04FF17
	==> default: gpg:
	==> default: Can't check signature: public key not found
	
This should be installed as `Vagrant` login user.

Try `su` command.

	# run a command as Vagrant user then exit
	su -c _something vagrant
	
	# change user
	su - vagrant