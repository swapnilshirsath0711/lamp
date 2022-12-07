#
# Cookbook:: lamp
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
#


  package 'httpd' do
	  action :install
  end

  file '/var/www/html/index.html' do
    action :create
	  content "<h1>Hello, Welcome to Chef Tutorials!</h1><br>"
  end 
  
  service 'httpd' do
    action [:start, :enable]
  end
  
  template node['lamp']['index_path'] do
    source 'index.erb'
  end

  httpd_config 'default' do
	  source 'default.conf.erb'
  end
