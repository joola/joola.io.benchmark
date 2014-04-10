#!/bin/bash
COUNTER=1
nodes=$1
flavor=$2
while [  $COUNTER -le $nodes ]; do
    knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 3 -f $flavor -N mongod$COUNTER -L mongod$COUNTER --run-list "role[mongod]" -P joola.password -A $LINODE_API &
    let COUNTER=COUNTER+1
done
