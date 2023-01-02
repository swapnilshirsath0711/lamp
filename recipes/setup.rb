# Cookbook:: lamp
# Recipe:: setup
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'httpd' do
	action :install
end

template node['lamp']['index_path'] do
  source 'index.erb'
  variables ({ipaddress: node['ipaddress']})
end

service 'httpd' do
  action [:start, :enable]
end

package 'mysql-server' do
  action :install
end

service 'mysqld' do
  action [:start, :enable]
end

package 'php' do
  action :install
end

package 'php-mysql' do
  action :install
  notifies :restart, 'service[httpd]'
end

node['lamp']['servers'].each do |host, port_data|
  root_directory = "/var/www/swapnil/#{host}"
  
  directory "/etc/httpd/swapnil/conf.d" do
  recursive true
  end

  template "/etc/httpd/swapnil/conf.d/#{host}.conf" do
    source "default.conf.erb"
    mode "0644"
    variables(
      :root_directory => root_directory,
      :port => port_data["port"],
      :host => host
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
      :host => host,
      :port => port_data["port"]
    )
  
  end
end
