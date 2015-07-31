# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'batchbook/client/version'

Gem::Specification.new do |spec|
  spec.name          = "batchbook-client"
  spec.version       = Batchbook::Client::VERSION
  spec.authors       = ["vaberay"]
  spec.email         = ["ramon@wishpond.com"]
  spec.summary       = %q{In house gem used by wishpond to acces the batchbook CRM Api.}
  spec.description   = %q{The methods available here are using the net/http module to perform resful api calls to batchbook.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "sinatra"
end
