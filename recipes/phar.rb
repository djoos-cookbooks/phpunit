#
# Cookbook Name:: phpunit
# Recipe:: phar
#
# Copyright (c) 2016, David Joos
#

remote_file "#{node['phpunit']['install_dir']}/phpunit" do
  source node['phpunit']['phar_url']
  mode 0755
end
