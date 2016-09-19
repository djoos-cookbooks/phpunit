#
# Cookbook Name:: phpunit
# Recipe:: composer
#
# Copyright (c) 2016, David Joos
#

include_recipe 'git'
include_recipe 'composer'

phpunit_dir = "#{Chef::Config[:file_cache_path]}/phpunit"

directory phpunit_dir do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

# figure out what version to install
version = if node['phpunit']['version'] != 'latest'
            node['phpunit']['version']
          else
            '*.*.*'
          end

# composer.json
template "#{phpunit_dir}/composer.json" do
  source 'composer.json.erb'
  owner 'root'
  group 'root'
  mode 0600
  variables(
    :version => version,
    :bindir => node['phpunit']['prefix']
  )
end

# composer update
execute 'phpunit-composer' do
  user 'root'
  cwd phpunit_dir
  command 'composer update'
  action :run
end
