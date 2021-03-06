#
# Cookbook Name:: gocd
# Recipe:: server
#
# Copyright (C) 2015 thenathanjones
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'gocd::jre'

package 'git'
package 'subversion'

ruby_block 'disable autostart' do
  block do
    ENV['DO_NOT_START_SERVICE'] = 'Y'
  end
end

if node[:gocd][:version]
  include_recipe 'gocd::install_experimental_server'
else
  include_recipe 'gocd::setup_repository'
  package 'go-server'
end

ruby_block 'enable autostart' do
  block do
    ENV.delete 'DO_NOT_START_SERVICE'
  end
end

template '/etc/default/go-server' do
  source 'go-server.erb'
  mode '0644'
  owner 'go'
  group 'go'
end

template '/etc/go/cruise-config.xml' do
  source 'cruise-config.xml.erb'
  mode '0644'
  owner 'go'
  group 'go'
end

service 'go-server' do
  action [:enable, :start]
end
