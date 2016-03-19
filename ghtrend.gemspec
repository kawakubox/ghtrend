# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghtrend/version'

Gem::Specification.new do |spec|
  spec.name          = "ghtrend"
  spec.version       = Ghtrend::VERSION
  spec.authors       = ["kawakubox"]
  spec.email         = ["shigefumi.kawakubo@gmail.com"]

  spec.summary       = %q{ GitHub trend page parser. }
  spec.description   = %q{ GitHub trend page parser. }
  spec.homepage      = 'https://github.com/kawakubox/ghtrend'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency             "oga", "~> 2.2"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
