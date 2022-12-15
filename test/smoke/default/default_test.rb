# InSpec test for recipe lamp::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

  unless os.windows?
    describe user('root') do
      it { should exist }
      skip 'This is an example test, replace it with your own test.'
    end
  end
  
  describe port(80) do
    it { should be_listening }
    skip 'This is an example test, replace it with your own test.'
  end