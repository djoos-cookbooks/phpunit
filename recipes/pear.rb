#
# Cookbook Name:: phpunit
# Recipe:: pear
#
# Copyright (c) 2016, David Joos
#

include_recipe 'php'

# PHP Extension and Application Repository PEAR channel
pearhub_chan = php_pear_channel 'pear.php.net' do
  action :update
end

# upgrade PEAR
php_pear 'PEAR' do
  channel pearhub_chan.channel_name
  action :upgrade
end

# Symfony2 PEAR channel
php_pear_channel 'pear.symfony.com' do
  action :discover
end

# PHPUnit PEAR channel
pearhub_chan = php_pear_channel 'pear.phpunit.de' do
  action :discover
end

# install/upgrade PHPUnit
package = 'PHPUnit'

# upgrade when package is installed and latest version is required
action = if !`pear list | grep #{package}`.empty? && node['phpunit']['version'] == 'latest'
           :upgrade
         else
           :install
         end

php_pear package do
  channel pearhub_chan.channel_name
  version node['phpunit']['version'] if node['phpunit']['version'] != 'latest'
  action action
end
