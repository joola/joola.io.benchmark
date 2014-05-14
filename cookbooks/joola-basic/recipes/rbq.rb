
include_recipe 'yum::epel'
include_recipe 'yum::remi'

bash "install git" do
	code <<-EOH
	yum -y install git
	EOH
end

bash "install erlang" do
        code <<-EOH
        yum -y install erlang
        EOH
end

bash "install rbq server" do
	code <<-EOH
	rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
	yum -y install rabbitmq-server
	/usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_stomp
	service rabbitmq-server start
	EOH
end
