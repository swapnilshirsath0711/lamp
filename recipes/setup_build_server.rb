# frozen_string_literal: true

require 'json'

# Download chef workstation
remote_file 'chef-workstation-0.3.2-1.el6.x86_64.rpm' do
  source 'https://packages.chef.io/files/stable/chef-workstation/0.3.2/el/7/chef-workstation-0.3.2-1.el6.x86_64.rpm'
  action :create
end

yum_package 'chef-workstation' do
  source 'chef-workstation-0.3.2-1.el6.x86_64.rpm'
  action :install
end

# Binaries in /bin directory should points to already installed version of chef,
# not chef-workstation (to make chef-client work properly)
%w(chef-apply chef-client chef-shell chef-solo knife ohai).each do |binary|
  file "/bin/#{binary}" do
    action :delete
    not_if { File.readlink("/bin/#{binary}").eql?("/opt/chef/bin/#{binary}") }
  end

  link "/bin/#{binary}" do
    to "/opt/chef/bin/#{binary}"
  end
end

# Required to sign rpm packages (devscript dependency)
yum_package 'rpm-sign' do
  action :install
end

build_server_databag = {
  "id": "build_server",
  "chef_workstation_gems": {
    "bundler": "2.1.4",
    "cookstyle": "",
    "danger": "8.6.1"
  },
  "build_server_packages": {
    "nodejs": ""
  },
  "passenger_key": "e42303f5b710f2801cf438a25f02d68ab5abb65ee43a680104068433624e0949"
}
# Install gems in chef-workstation ruby, fetch list from databag test_kitchen/build_server
chef_workstation_gems = build_server_databag['chef_workstation_gems'] || {}

chef_workstation_gems.each do |gem, version|
  coupa_gem gem do
    ruby_binary '/opt/chef-workstation/embedded/bin/ruby'
    fips_mode false
    version version unless version.empty?
    action :install
  end
end

# Install packages, fetch list from databag test_kitchen/build_server
build_server_packages = build_server_databag['build_server_packages'] || {}

build_server_packages.each do |pkg, version|
  package pkg do
    version version unless version.empty?
    action :install
  end
end