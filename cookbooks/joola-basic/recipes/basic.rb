#
# Cookbook Name:: jarvis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::epel'
include_recipe 'yum::remi'

# CREATE THE JOOLA GROUP
group "joola" do
  gid 1500
end

# CREATE THE JOOLA USER
user "joola" do
  comment "Joola"
  home "/home/joola"
  gid "joola"
  shell "/bin/bash"
  password "$1$iM5DBZ6Z$EZw6e28BUw3DqK8z.dfEj."
end

ruby_block "add joola to sudoers" do
  block do
    file = Chef::Util::FileEdit.new("/etc/sudoers")
    file.search_file_replace("/root/", "joola")
    file.write_file
  end
end

#service "joola" do
#  service_name "joola"
#  supports :restart => true, :start => true, :stop => true
#  action :start
#end 

#INSTALL GIT
yum_package "git" do
  action :install
end
