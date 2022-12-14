# InSpec test for recipe practice::default

# The InSpec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
    # This is an example test, replace with your own test.
    describe user('root')
      it { should exist }
    end
  end
  
  # This is an example test, replace it with your own test.
  describe port(80)
    it { should be_listening }
  end