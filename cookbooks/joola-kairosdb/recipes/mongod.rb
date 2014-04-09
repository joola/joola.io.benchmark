# START MONGOD
bash "start mongod" do
	code <<-EOH
	service mongod restart
	EOH
end
