#
# Cookbook:: lamp
# Recipe:: php
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#

package 'php' do
    action :install
  end
  
service 'php' do
  action [:start, :enable]
end