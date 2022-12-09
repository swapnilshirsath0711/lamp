#
# Cookbook:: lamp
# Recipe:: server
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  # package 'httpd' do
	#   action :install
  # end

  # file '/var/www/html/index.html' do
  # file node['lamp']['index_path'] do
  #   action :create
	#   content "<h1>Hello</h1><br>
  #   <h2>Welcome to Chef Tutorials!</h2><br>
  #   <h3>Hostname : #{node['hostname']}</h3><br>
  #   <h3>IP Address : #{node['ipaddress']}</h3><br>
  #   <h3>Total Memory : #{node['memory']['total']}</h3><br>
  #   <h3>Platform : #{node['platform']}</h3><br>
  #   "
  # end 
  
  # Using template resource instead of file resource to generate dynamic content

  # template node['lamp']['index_path'] do
  #   source 'index.erb'
  #   variables ({ipaddress: node['ipaddress']})
  # end
  
  # service 'httpd' do
  #   action [:start, :enable]
  # end


# commenting all above code and using directory resource
# setting up httpd configuration. directory "document_root" has html page (index.html) and configuration files for httpd

directory node['lamp']['server']['document_root'] do
  recursive true
end

# 'httpd_config' resource comes with dependency 'httpd' added in metadata file 

httpd_config 'default' do
  source 'default.conf.erb'
end

# httpd_service resource also comes with dependency 'httpd' (i.e. community cookbook) added in metadata file
# mpm 'prefork' is used for php

httpd_service 'default' do
  mpm 'prefork'
  action [:create, :start]
  subscribes :restart, 'httpd_config[default]'
end

# notifies --> will notify the other resource if there is any change in current resource
# subscribes --> will receive the notification from other resource

# subscribes :restart, 'httpd_config[default]' --> will receive notification when there is any change in 'httpd_config[default]'