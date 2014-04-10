#!/bin/bash
COUNTER=1
nodes=$1
flavor=$2
while [  $COUNTER -le $nodes ]; do
    knife linode server create --template-file bootstrap.centos64.erb -I 119 -D 3 -f $flavor -N node$COUNTER -L node$COUNTER --run-list "role[joolaio]" -P joola.password -A $LINODE_API &
    let COUNTER=COUNTER+1
done
