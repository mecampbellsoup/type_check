# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'type_check/version'

Gem::Specification.new do |spec|
  spec.name          = "type_check"
  spec.version       = TypeCheck::VERSION
  spec.authors       = ["mecampbellsoup"]
  spec.email         = ["mecampbell25@gmail.com"]

  spec.summary       = %q{Ruby type checking library}
  spec.description   = %q{Provides type checking and additional applications like enforcing type declarations for API endpoint parameters.}
  spec.homepage      = "https://github.com/mecampbellsoup/type_check"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_runtime_dependency 'actionpack', '~> 5.0.0', '>= 5.0.0'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'

  # Testing
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rspec-rails'

  # Debugging
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'pry'
end
