#!/bin/bash
knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f 5 -N jnode -L jnode --run-list "recipe[joola-mongodb::joola]" -P joola.password -A $LINODE_API &
