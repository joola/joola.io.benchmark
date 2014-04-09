#!/bin/bash 
COUNTER=1
nodes=$1
flavor=$2
while [  $COUNTER -le $nodes ]; do
    knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f $flavor -N cassandra$COUNTER -L cassandra$COUNTER --run-list "recipe[joola-kairosdb::default]" -P joola.password -A $LINODE_API &
    let COUNTER=COUNTER+1 
done
