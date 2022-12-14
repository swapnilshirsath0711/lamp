#
# Cookbook:: lamp
# Recipe:: setup
#
# Copyright:: 2022, The Authors, All Rights Reserved.

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
    variables ({ipaddress: node['ipaddress']})
  end
  
  service 'httpd' do
    action [:start, :enable]
  end

  # install, start and enable mysql
  
  # mysql_connection_info = {
  #   'host'=> '10.1.1.210',
  #   'username'=> 'swapnil.shirsath',
  #   'password'=> node['lamp']['database']['root_password']
  # }

package 'mysql-server' do
  action :install
end

service 'mysqld' do
  action [:start, :enable]
end

# install php
package 'php' do
  action :install
end

package 'php-mysql' do
  action :install
  notifies :restart, 'service[httpd]'
end

# # commenting all above code and using directory resource
# # setting up httpd configuration. directory "document_root" has html page (index.html) and configuration files for httpd

# directory node['lamp']['setup']['document_root'] do
#   recursive true
# end

# # 'httpd_config' resource comes with dependency 'httpd' added in metadata file 

# httpd_config 'default' do
#   source 'default.conf.erb'
# end

# # httpd_service resource also comes with dependency 'httpd' (i.e. community cookbook) added in metadata file
# # mpm 'prefork' is used for php

# httpd_service 'default' do
#   mpm 'prefork'
#   action [:create, :start]
#   subscribes :restart, 'httpd_config[default]'
# end

# # notifies --> will notify the other resource if there is any change in current resource
# # subscribes --> will receive the notification from other resource

# # subscribes :restart, 'httpd_config[default]' --> will receive notification when there is any change in 'httpd_config[default]'









#storing all the passwords from passwords/mysql.json file to the "passwords" variable


# mysql_service 'default' do
#    initial_root_password node['lamp']['database']['root_password']
#    action [:create, :start]
#  end

# mysql_client 'default' do
#     action :create
#   end


# mysql2_chef_gem 'default' do
#   action :install
# end



# mysql_database node['lamp']['database']['dbname'] do
#   connection mysql_connection_info
#   action :create
# end

# mysql_database_user node['lamp']['databse']['admin_username'] do
#   connection mysql_connection_info
#   password node['lamp']['database']['admin_password']
#   database_name node['lamp']['database']['dbname']
#   host '127.0.0.1'  
#   action [:create, :grant]
# end


