joola.io.benchmark
==================

##INTRO

This repo contains a set of chef recipes that can be used to deploy a full joola.io instance including a sharded mongo setup

##HOW TO USE

First, you will need to set up a chef server, then do the following

1. Clone this repo
2. Add the .pem files for the validator user and chef server admin user to the .chef/ directory
3. Run `knife list` to make sure everything is set up correctly
4. Upload the recipes to your chef server by running  
`knife cookbook upload --all`
5. Use the .sh scripts included in this repo to deploy the mongo and joola.io nodes
6. The .sh files are using Linode's APIs to set up the servers, so you'll need to register and save your Linode API key as a env var:  
`export LINODE_API=<your key>`
7. Currently the amount of config servers are hardcoded to 3, to create the cfg servers run:  
`sh deploy-cfg.sh`
8. Deploy the mongod servers, the deploy-mongod.sh file takes two parameters, amount of servers and server flavor (1=1024,2=2048...)  
`sh deploy-cfg.sh 3 6`
9. Deploy the mongos servers, currently the amount of mongos servers is hardcoded to 1  
`sh deploy-mongos.sh`
10. Deploy the joola.io server, currently the amount of joola.io servers is hardcoded to 1

## TODO:

See issues.
