#
# Cookbook Name:: phpunit
# Recipe:: phar
#
# Copyright 2012-2014, Escape Studios
#

remote_file node[:phpunit][:install_path] do
  source node[:phpunit][:phar_url]
  mode 0755
end
