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


node["lamp"]["sites"]["site1"] do
  root_directory = node['lamp']['server']['document_root']
  template "/etc/httpd/mayur/conf.d/#{site}.conf" do
    source "default.conf.erb"
    mode "0644"
    variables(
      :root_directory => root_directory,
      :port => port_data["port"],
      :site => site
    )
    notifies :restart, "service[httpd]"
    end
  directory root_directory do 
    mode "0755"
    recursive true
  end

  template "#{root_directory}/index.html" do
    source "app.html.erb"
    mode "0755"
    variables(
      :site => site1,
      :port => port_data["port"]
    )
  
  end
end