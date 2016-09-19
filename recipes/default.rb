#
# Cookbook Name:: phpunit
# Recipe:: default
#
# Copyright (c) 2016, David Joos
#

case node['phpunit']['install_method']
when 'pear'
  include_recipe 'phpunit::pear'
when 'composer'
  include_recipe 'phpunit::composer'
when 'phar'
  include_recipe 'phpunit::phar'
end
