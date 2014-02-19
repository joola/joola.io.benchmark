# START THE MONGOS AFTER QUERYING CHEF SERVER FOR CFG SERVERS

cfg1 = search(:node, "name:cfg1")
cfg2 = search(:node, "name:cfg2")
cfg3 = search(:node, "name:cfg3")
mongod1 = search(:node, "name:mongod1")
mongod2 = search(:node, "name:mongod2")
mongod3 = search(:node, "name:mongod3")


bash "start mongodb cfg" do
	code <<-EOH
	service mongod stop
	mongos --configdb #{cfg1[0]["ipaddress"]}:27019,#{cfg2[0]["ipaddress"]}:27019,#{cfg3[0]["ipaddress"]}:27019 --fork --logpath /var/log/mongodb.log
	mongo --eval "sh.addShard('#{mongod1[0]["ipaddress"]}:27017')"
	mongo --eval "sh.addShard('#{mongod2[0]["ipaddress"]}:27017')"
	mongo --eval "sh.addShard('#{mongod3[0]["ipaddress"]}:27017')"
	mongo --eval "sh.enableSharding('cache')"
	mongo --eval "sh.shardCollection('cache.joola_bc_tx',{'_key':1})"
	EOH
end

#bash "get benchmark db" do
#	timeout 60000000
#	code <<-EOH
#	yum -y install wget
#	cd /tmp
#	wget http://176.58.107.99/mongodb.tar.gz
#	EOH
#end

#bash "restore benchmark db" do
#	timeout 6000000
#	code <<-EOH
#	cd /tmp
#	tar fx mongodb.tar.gz
#	mongorestore dump
#	EOH
#end
