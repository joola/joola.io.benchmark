#!/bin/bash
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 3 -f 5 -N rbq -L rbq --run-list "role[rbq]" -P joola.password -A $LINODE_API &
