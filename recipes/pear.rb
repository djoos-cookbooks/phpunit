#
# Cookbook Name:: phpunit
# Recipe:: pear
#
# Copyright 2012, Escape Studios
#

include_recipe "php"

#PHP Extension and Application Repository PEAR channel
php_pear_channel "pear.php.net" do
  action :update
end

#upgrade PEAR
php_pear "pear" do
	action :upgrade
end

#a component that PHPUnit depends upon is hosted on the Symfony2 PEAR channel
php_pear_channel "pear.symfony.com" do
    action :discover
end

#PHPUnit PEAR channel
pearhub_chan = php_pear_channel "pear.phpunit.de" do
	action :discover
end

#upgrade PHPUnit
php_pear "phpunit" do
	channel pearhub_chan.channel_name
	if node[:phpunit][:version] != "latest"
		version "#{node[:phpunit][:version]}"
	end
	action :upgrade
end