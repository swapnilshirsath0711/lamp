require 'chefspec'
require 'chefspec/berkshelf'
require 'serverspec'
require '/var/spool/cloud/coupa-data.rb'

# include SpecInfra::Helper::Exec
# include SpecInfra::Helper::DetectOS
set :backend, :exec
set :path, '/usr/local/bin:$PATH'

RSpec.configure do |c|
  c.add_formatter 'documentation'
  c.add_formatter 'html', '/tmp/kitchen-report.html'
end