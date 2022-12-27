#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#

# include_recipe 'lamp::setup'
# include_recipe 'lamp::database'
include_recipe 'lamp::prep'
# include_recipe 'lamp::httpd'
# include_recipe 'lamp::mysql'

# create_tables = ::File.join(Chef::Config[:file_cache_path], 'create-table.sql')

# # cookbook_file '/path/on/node' do
# cookbook_file create_tables do
#     source 'create-table.sql'
# end

# execute "initialize #{node['lamp']['database']['dbname']} database" do
#     command "mysql -h 127.0.0.1 -u #{node['lamp']['database']['admin_username']} -p#{node['lamp']['database']['admin_password']} -D #{node['lamp']['database']['dbname']} < #{create_tables}"
#     not_if "mysql -h 127.0.0.1 -u #{node['lamp']['database']['admin_username']} -p#{node['lamp']['database']['admin_password']} -D #{node['lamp']['database']['dbname']} -e 'describe client;'"
# end

# # guards ---> not_if AND only_if
# # include_recipe 'lamp::setup_build_server'

# template "#{node['lamp']['setup']['document_root']}/index.php" do
#     source 'index.php.erb'
#     variables({
#         servername: '127.0.0.1',
#         admin_password: "#{node['lamp']['database']['admin_password']}"
#     })
# end