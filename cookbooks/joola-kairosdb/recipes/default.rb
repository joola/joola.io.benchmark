#
# Cookbook Name:: alias
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Alias `h` to go home

file "/etc/yum.repos.d/datastax.repo" do
  owner "root"
  group "root"
  mode "0644"
  action :create
  content "[datastax]\nname=DataStax Repo for Apache Cassandra\nbaseurl=http://rpm.datastax.com/community\ngpgcheck=0\nenabled=1\n"
end

# INSTALL THE MONGO PACKAGE
yum_package "dsc12" do
  action :install
end
yum_package "cassandra12" do
  action :install
end

bash "download jdk" do
	code <<-EOH
	wget --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm
	rpm -Uhv jdk-7u51-linux-x64.rpm
	alternatives --install /usr/bin/java java /usr/java/latest/jre/bin/java 200000
	alternatives --install /usr/bin/javaws javaws /usr/java/latest/jre/bin/javaws 200000
	alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000
	alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 200000
	EOH
end

# ADD MONGO TO SYSTEM BOOT AND START MONGO
#bash "install mongo" do
#	code <<-EOH
#	chkconfig mongod on
#  	/etc/init.d/mongod restart
#	EOH
#end
