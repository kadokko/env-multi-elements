# Multiple Elements Environment


## Overview

This script easily builds two communicable elements daemons. 

The daemons run in regtest mode. 

Also, they run as docker containers.

- OS: Ubuntu Xenial(16.04)
- Elements: 0.14.1


## Requirement

- Vagrant ( 2.2.0 )
- VirtualBox ( 5.2.20 )


## Usage

* installation

```bash
$ git clone https://github.com/kadokko/env-multi-elements.git
$ cd env-multi-elements
$ vagrant up
$ vagrant ssh
$ cd /vagrant_share
$ ./start.sh
```

* elements-cli

```bash
$ docker exec -it elements1 /bin/bash
$ elements-cli generate 3
$ exit

$ docker exec -it elements2 /bin/bash
$ elements-cli getblockcount
$ exit
```

* elements rpc

```bash
$ curl --data-binary '{"jsonrpc": "1.0", "id":"rpc-test", "method": "getblockcount", "params": [] }' \
       -H 'content-type: text/plain;' http://user:password@localhost:20001/
$ curl --data-binary '{"jsonrpc": "1.0", "id":"rpc-test", "method": "getblockcount", "params": [] }' \
       -H 'content-type: text/plain;' http://user:password@localhost:20002/
```

