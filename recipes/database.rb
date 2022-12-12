#
# Cookbook:: lamp
# Recipe:: database
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
#

#storing all the passwords from passwords/mysql.json file to the "passwords" variable


# package 'mysql-server' do
#   action :install
# end

# service 'mysqld' do
#   action [:start, :enable]
# end

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

# mysql_connection_info = {
#   'host'=> '127.0.0.1',
#   'username'=> 'root',
#   'password'=> node['lamp']['database']['root_password']
# }

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


# ------ TRIAL -------

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end
mysql_service 'default' do
  version '8.5.1'
  bind_address '0.0.0.0'
  port '3306'
  data_dir '/data'
  initial_root_password "password123"
  action [:create, :start]
end
# ------ TRIAL -------ß