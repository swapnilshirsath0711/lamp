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




# # ============================================================================================================
# # ------ code from chat.openai.com ---------

# # To setup multiple applications on the same server with different hosts using chef, you can use the 'apache2' cookbook and the 'web_app' resource.
# # Here's an example of how you might do this:
#     # ---- code 1 ------
#         # install the Apache web server
#         include_recipe 'apache2'
#         # Set up the first application 
#         web_app 'app1' do
#             server_name 'app1.example.com'
#             server_aliases ['www.app1.example.com']
#             docroot '/srv/app1/public'
#         end
        
#     # ------code 2 ------
#         # Set up the second application 
#         web_app 'app2' do
#             server_name 'app2.example.com'
#             server_aliases ['www.app2.example.com']
#             docroot '/srv/app2/public'
#         end

# # This code installs the Apache web server and then sets up two applications, 'app1' and 'app2', with different server names and document roots.
# # The 'server_name' property specifies the hostname for the application, and the 'server_aliases' property allows you to specify additional hostnames that should be routed to the same application.
# # The 'docroot' property specifies the directory where the application's files are stored.
# # You can then use the 'service' resource to start and enable  the Apache web server:
#         # code for 'service' resource
#         service 'apache2' do
#             action [:enable, :start]
#         end
#     # this will start the Apache web server and enable it to start automatically on boot.
#     # 
# # --------------   END  --------------------