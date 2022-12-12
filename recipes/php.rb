#
# Cookbook:: lamp
# Recipe:: php
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#

package 'php' do
    action :install
  end

package 'php5-mysql' do
  action :install
  notifies :restart, 'service[httpd]'
end