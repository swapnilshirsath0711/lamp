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

  template node['lamp']['index_path'] do
    source 'index.erb'
  end
  
  service 'httpd' do
    action [:start, :enable]
  end

  # httpd_config 'default' do
	#   source 'default.conf.erb'
  # end
