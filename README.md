2018-1-unattended-elasticsearch
===============================

# LICENSE
```
Copyright 2018 Yamir Encarnacion <yencarnacion@webninjapr.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

# Description: 
Scripts for Unattended single node elasticsearch with Kibana 
Linux Virtual Machine Creation using kickstart

## Notes:

1. Step 1
```sh
$ sudo ./go-elastic01.sh
```
- creates an Ubuntu 16.04 (xenial) virtual machine with elasticsearch+kibana:
```
username: yamir
password: root4me
```
## For All the commands below `sudo` may be required

## Commands to find the ip address of the vm
```sh
$ virsh net-list
$ virsh net-dhcp-leases <net-name>
$ virsh net-dhcp-leases default

# to figure out vm ip
$ sudo virsh domiflist elastic01.example.com
$ arp -e 
$ arp -an
```

## Commands to Delete VM when done
```sh
virsh list --all
virsh destroy elastic01.example.com
virsh undefine elastic01.example.com
virsh vol-delete --pool images elastic01.example.com
```

## Command to shutdown VM
```sh
virsh shutdown elastic01.example.com
```

## Command to start VM
```sh
virsh start elastic01.example.com
```

## Other notes
If a different hostname is desired, remember to change the
hostname in the ks.cfg file and the .sh file.  Also, remember 
to change the disk name.

To access ports 5601 and 9200 of guest vm via kvm host do 
as follows from host
```sh
$ ssh -g -f -N -L 5601:<remote guest ip>:5601 <remote guest ip>
$ ssh -g -f -N -L 9200:<remote guest ip>:9200 <remote guest ip>
```
