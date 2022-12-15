# InSpec test for recipe lamp::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
require 'os'

  # unless OS.windows?
  #   describe user('root') do
  #     it { should exist }
  #   end
  # end
  
  # describe port(80) do
  #   it { should be_listening }
  #   its(:protocols) { should include 'tcp' }
  # end

  describe file('/var/www/default/public_html/index.php') do
    it { should exist }
    it { should be_owned_by 'root' }
    its(:content) {should match '<!DOCTYPE html>' }
  end

  describe command('curl localhost') do
    its(:stdout) { should match 'swapnil' }
  end
