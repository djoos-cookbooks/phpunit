#
# Cookbook Name:: phpunit
# Recipe:: pear
#
# Copyright 2012-2013, Escape Studios
#

include_recipe "php"

#PHP Extension and Application Repository PEAR channel
pearhub_chan = php_pear_channel "pear.php.net" do
  action :update
end

#upgrade PEAR
php_pear "PEAR" do
    channel pearhub_chan.channel_name
    action :upgrade
end

#Symfony2 PEAR channel
php_pear_channel "pear.symfony.com" do
    action :discover
end

#PHPUnit PEAR channel
pearhub_chan = php_pear_channel "pear.phpunit.de" do
    action :discover
end

#install/upgrade PHPUnit
package = "PHPUnit"

php_pear package do
    channel pearhub_chan.channel_name
    if node[:phpunit][:version] != "latest"
        version "#{node[:phpunit][:version]}"
    end
    #upgrade when package is installed and latest version is required
    action ( !(`pear list | grep #{package}`.empty?) and node[:phpunit][:version] == "latest" ) ? :upgrade : :install
end