# InSpec test for recipe lamp::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

  unless os.windows?
    # This is an example test, replace with your own test.
    describe user('root') do
      it { should exist }
      skip 'This is an example test, replace it with your own test.'
    end
  end
  
  # This is an example test, replace it with your own test.
  describe port(80) do
    it { should be_listening }
    skip 'This is an example test, replace it with your own test.'
  end