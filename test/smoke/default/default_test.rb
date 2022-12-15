# InSpec test for recipe lamp::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
require 'os'

  unless OS.windows?
    describe user('root') do
      it { should exist }
    end
  end
  
  describe port(80) do
    it { should be_listening }
  end