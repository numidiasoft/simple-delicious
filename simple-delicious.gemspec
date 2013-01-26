# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple-delicious/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["numidiasoft"]
  gem.email         = ["tarik.ihadjadene@gmail.com"]
  gem.description   = %q{simple api to interact with delicious}
  gem.summary       = %q{simple api to interact with delicious}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "simple-delicious"
  gem.require_paths = ["lib"]
  gem.version       = Simple::Delicious::VERSION
  gem.add_dependency  'httparty'
  gem.add_dependency  'rake'
  gem.add_development_dependency  'fakeweb'
  gem.add_development_dependency  'log4r'
  gem.add_development_dependency 'rspec', '~> 2.5'
end
