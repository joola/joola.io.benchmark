
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

bash "get joola" do
        code <<-EOH
	cd /tmp
        git clone https://github.com/joola/joola.io.git
	cd joola.io
	npm install
	npm install -g pm2
	pm2 start joola.io
        EOH
end
