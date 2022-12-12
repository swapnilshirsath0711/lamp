#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#

include_recipe 'lamp::server'
include_recipe 'lamp::database'
include_recipe 'lamp::php'