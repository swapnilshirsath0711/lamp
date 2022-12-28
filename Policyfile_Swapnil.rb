# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'Policyfile_Swapnil'

default_source :supermarket

run_list 'lamp::default'

cookbook 'lamp', '~> 1.0.0', git: 'git@github.com:swapnilshirsath0711/lamp.git', branch: 'main'

