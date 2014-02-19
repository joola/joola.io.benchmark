#
# Cookbook Name:: alias
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Alias `h` to go home

file "/etc/yum.repos.d/10gen.repo" do
  owner "root"
  group "root"
  mode "0644"
  action :create
  content "[10gen]\nname=10gen Repository\nbaseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64\ngpgcheck=0\nenabled=1\n"
end

# INSTALL THE MONGO PACKAGE
yum_package "mongo-10gen" do
  action :install
end
yum_package "mongo-10gen-server" do
  action :install
end

# ADD MONGO TO SYSTEM BOOT AND START MONGO
#bash "install mongo" do
#	code <<-EOH
#	chkconfig mongod on
#  	/etc/init.d/mongod restart
#	EOH
#end
