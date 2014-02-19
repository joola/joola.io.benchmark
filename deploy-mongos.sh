#!/bin/bash
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 5 -N mongos -L mongos --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::mongos]" -P joola.password -A $LINODE_API &
