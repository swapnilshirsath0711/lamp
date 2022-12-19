# file paths.
default['lamp']['index_path'] = '/var/www/html/index.html'
default['lamp']['setup']['document_root'] = '/var/www/default/public_html'

# Ports for different hosts.
default['lamp']['servers']['host1'] = { "port" => 3001 }
default['lamp']['servers']['host2'] = { "port" => 3002 }

# Database config
# default['lamp']['database']['dbname'] = 'default'
# default['lamp']['database']['admin_username'] = 'dbadmin'
# default['lamp']['database']['root_password'] = 'Myrootpass@123'
# default['lamp']['database']['admin_password'] = 'root123'