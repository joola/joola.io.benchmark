# START THE MONGOS AFTER QUERYING CHEF SERVER FOR CFG SERVERS

cfg1 = search(:node, "name:cfg1")
cfg2 = search(:node, "name:cfg2")
cfg3 = search(:node, "name:cfg3")

bash "start mongodb cfg" do
	code <<-EOH
	service mongod stop
	mongos --configdb #{cfg1[0]["ipaddress"]}:27019,#{cfg2[0]["ipaddress"]}:27019,#{cfg3[0]["ipaddress"]}:27019 --fork --logpath /var/log/mongodb.log
	EOH
end

search(:node, 'role:mongod').each do |result|
	bash "add shards" do
		code <<-EOH
		mongo --eval "sh.addShard('#{result["ipaddress"]}:27017')"
		EOH
	end
end

bash "enable sharding" do
	code <<-EOH
	mongo --eval "sh.enableSharding('cache')"
	mongo --eval "sh.shardCollection('cache.joola_bc_tx',{'timestamp':1})"
	EOH
end
