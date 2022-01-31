#
# Cookbook:: phpunit
# Recipe:: composer
#
# Copyright:: (c) 2016, David Joos
#

include_recipe 'git'
include_recipe 'composer'

phpunit_dir = "#{Chef::Config[:file_cache_path]}/phpunit"

# Before creating the dir, first delete the old directory where the composer files
# are stores. This because the Chef cache can be persistent, which causes Composer
# to not install the executable, even if "bin-dir" is set.
directory phpunit_dir do
    recursive true
    action :delete
end

directory phpunit_dir do
  owner 'root'
  group 'root'
  mode '755'
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
  mode '600'
  variables(
    version: version,
    bindir: node['phpunit']['prefix']
  )
end

# composer install
execute 'phpunit-composer' do
  user 'root'
  cwd phpunit_dir
  command 'composer install'
  action :run
end
