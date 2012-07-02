# -*- encoding: utf-8 -*-
require File.expand_path('../lib/arara/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nícolas Iensen", "Luiz Fonseca"]
  gem.email         = ["nicolas@engage.is", "luiz@engage.is"]
  gem.summary       = %q{Wrapper para a API do Verdade ou Consequência}
  gem.homepage      = "https://github.com/meurio/arara"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "arara"
  gem.require_paths = ["lib"]
  gem.version       = Arara::VERSION

  gem.add_development_dependency("rspec")
  gem.add_development_dependency("httparty")
  gem.add_development_dependency("webmock")
end
