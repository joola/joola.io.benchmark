# CREAT THE MONGODB CONFIG FOLDER
bash "create mongo cfg folder" do
	code <<-EOH
	mkdir -p /data/configdb
	EOH
end

bash "start mongodb cfg" do
	code <<-EOH
	mongod --configsvr --dbpath /data/configdb --fork --logpath /var/log/mongodb.log
	EOH
end
