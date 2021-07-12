# Module Installs

Make sure you install into directory:

```
puppet module install puppetlabs-apache --target-dir /Users/andrewpearson/Storage/Code/Puppet/modules 
```

Always do a `sudo` to install into the correct puppet directory location.
```
sudo puppet module list
```

## Networking

```mermaid
graph TB
	Internet --> ExternalHost
	
	ExternalHost[MacOS External IP - 70.80.90.100 ] 
		--> InternalHost
		
	InternalHost[MacOS Internal IP - 192.168.0.10] 
		--> VagrantExt
	
	VagrantExt[Vagrant External IP - 10.11.12.13] 
		--> VagrantGW
		
	VagrantGW[Vagrant Gateway IP - 10.0.2.2]
		--> xDEBUG
		
	xDEBUG
```

Find the gateway address with `ip r` or `netstat -nr -f inet`



