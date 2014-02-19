#!/bin/bash

knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 1 -N cfg1 -L cfg1 --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::cfg]" -P joola.password -A $LINODE_API &
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 1 -N cfg2 -L cfg2 --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::cfg]" -P joola.password -A $LINODE_API &
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 1 -N cfg3 -L cfg3 --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::cfg]" -P joola.password -A $LINODE_API &
