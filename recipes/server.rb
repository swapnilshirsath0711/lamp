#
# Cookbook:: lamp
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
#


  # package 'httpd' do
	#   action :remove
  # end

  # file '/var/www/html/index.html' do
  #   action :create
	#   content "<h1>Hello, Welcome to Chef Tutorials!</h1><br>"
  # end 
  
  # service 'httpd' do
  #   action [:start, :enable]
  # end
  
  # template node['lamp']['index_path'] do
  #   source 'index.erb'
  # end

  # httpd_config 'default' do
	#   source 'default.conf.erb'
  # end


  # -------

  package 'apache2'

  file '/var/www/html/index.html' do
    content '<h1>Hello, World!</h1>'
  end

  service 'apache2' do
    action [:start, :enable]
  end