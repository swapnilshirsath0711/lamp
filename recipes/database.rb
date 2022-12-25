#
# Cookbook:: lamp
# Recipe:: database
#
# Copyright:: 2022, The Authors, All Rights Reserved.

mysql_client 'default' do
    action :create
end

mysql_service 'default' do
    port '3306'
    initial_root_password 'Myrootpass@123'
    action [:create, :start]
end

mysql2_chef_gem 'default' do
    action :install
end

mysql_connection_info = {
    host: '127.0.0.1',
    username: 'root',
    password: 'Myrootpass@123'
}

mysql_database node['lamp']['database']['dbname'] do
    connection mysql_connection_info
    action :create
end

mysql_database_user node['lamp']['database']['admin_username'] do
    connection mysql_connection_info
    password 'Myrootpass@123'
    database_name node['lamp']['database']['dbname']
    host '127.0.0.1'
    action [:create, :grant]
end