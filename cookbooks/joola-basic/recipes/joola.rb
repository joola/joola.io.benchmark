
include_recipe 'yum::epel'
include_recipe 'yum::remi'

bash "install git" do
	code <<-EOH
	yum -y install git
	EOH
end

bash "install node" do
        code <<-EOH
        yum -y install npm
        EOH
end

bash "install redis" do
	code <<-EOH
	yum -y install redis
	service redis start
	EOH
end

bash "install joola" do
        code <<-EOH
        cd /tmp
        git clone https://github.com/joola/joola.io.git
        cd joola.io
        npm install
	EOH
end

mongos = search(:node, "name:mongos")
rbq = search(:node, "name:rbq")

template "/tmp/joola.io/config/baseline.json" do
  source "baseline.json.erb"
  mode 0777
  owner "root"
  group "root"
  variables({
     :mongos => mongos.first['ipaddress'],
     :rbq => rbq.first['ipaddress']
  })
end

bash "start joola" do
	code <<-EOH
	cd /tmp/joola.io
	npm install -g pm2
	pm2 start joola.io.js
        EOH
end
