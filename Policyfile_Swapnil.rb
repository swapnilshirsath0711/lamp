# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'Policyfile_Swapnil'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'lamp::default'
# named_run_list 'setup_build_server', 'lamp::setup_build_server'

# Specify a custom source for a single cookbook:


# if current version of chef does not support Berkshelf, we need to add dependencies here
# cookbook 'mysql', '~> 8.0'
# cookbook 'database', '~> 6.1'
# cookbook 'mysql2_chef_gem', '~> 2.0'

# metadata
cookbook 'httpd', '~> 0.4', :supermarket
cookbook 'mysql', '~> 8.0', :supermarket
cookbook 'database', '~> 6.1', :supermarket
cookbook 'mysql2_chef_gem', '~> 2.0', :supermarket
# end

cookbook 'selinux_policy', '~> 3.0.0', :supermarket
cookbook 'lamp', '~> 1.0.0', git: 'git@github.com:swapnilshirsath0711/lamp.git', branch: 'main'
# group :database do
#     cookbook 'mysql', '~> 8.0'
# end
