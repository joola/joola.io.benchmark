#!/bin/bash
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 3 -f 5 -N mongos -L mongos --run-list "role[mongos]" -P joola.password -A $LINODE_API &
