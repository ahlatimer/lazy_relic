# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lazy_relic/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Latimer"]
  gem.email         = ["andrew@elpasoera.com"]
  gem.description   = %q{NewRelic custom metric collection for LazyResource.}
  gem.summary       = %q{NewRelic custom metric collection for LazyResource.}
  gem.homepage      = "https://github.com/ahlatimer/lazy_relic"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "lazy_relic"
  gem.require_paths = ["lib"]
  gem.version       = LazyRelic::VERSION

  gem.add_dependency 'lazy_resource', '>= 0.4.0'
  gem.add_dependency 'newrelic_rpm'
end
