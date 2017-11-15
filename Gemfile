source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_GEM_VERSION') ? "= #{ENV['PUPPET_GEM_VERSION']}" : ['>= 3.3']
if Gem::Version.new(RUBY_VERSION.dup) < Gem::Version.new('1.9.0')
  rspecversion = '= 3.1.0'
  jsonversion = '= 1.8.6'
  spec_helper_version = '0.8.2'
else
  rspecversion = '>= 3.2.0'
  jsonversion = '>= 1.8.6'
  spec_helper_version = '>= 0.1.0'
end
gem 'puppet', puppetversion
gem 'rspec', rspecversion
gem 'json_pure', jsonversion
gem 'puppetlabs_spec_helper', spec_helper_version
gem 'puppet-lint', '>= 0.3.2'
gem 'puppet-syntax', '>=2.2.0'
gem 'facter', '>= 1.7.0'

