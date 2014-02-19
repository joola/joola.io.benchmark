#!/bin/bash
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 6 -N mongod1 -L mongod1 --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::mongod]" -P joola.password -A $LINODE_API &
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 6 -N mongod2 -L mongod2 --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::mongod]" -P joola.password -A $LINODE_API &
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 6 -N mongod3 -L mongod3 --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::mongod]" -P joola.password -A $LINODE_API &
