#!/bin/bash 
COUNTER=1
nodes=$1
flavor=$2
while [  $COUNTER -le $nodes ]; do
    knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 7 -f $flavor -N cfg$COUNTER -L cfg$COUNTER --run-list "recipe[joola-mongodb::default],recipe[joola-mongodb::cfg]" -P joola.password -A $LINODE_API &
    let COUNTER=COUNTER+1 
done
