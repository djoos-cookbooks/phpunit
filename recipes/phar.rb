#
# Cookbook Name:: phpunit
# Recipe:: phar
#
# Copyright (c) 2016, David Joos
#

if node['phpunit']['version'] != 'latest'
  # install custom version
  remote_file "#{node['phpunit']['install_dir']}/phpunit" do
    source "#{node['phpunit']['phar_url']}/phpunit-#{node['phpunit']['version']}.phar"
    mode 0755
  end
else
  # install latest version
  remote_file "#{node['phpunit']['install_dir']}/phpunit" do
    source "#{node['phpunit']['phar_url']}/phpunit.phar"
    mode 0755
  end
end
