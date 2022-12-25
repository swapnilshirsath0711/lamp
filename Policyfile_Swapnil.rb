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
cookbook 'lamp', '~> 0.1.0', git: 'git@github.com:swapnilshirsath0711/lamp.git', branch: 'main'

depends 'mysql', '~> 8.0'
depends 'database', '~> 6.1'
depends 'mysql2_chef_gem', '~> 2.0'