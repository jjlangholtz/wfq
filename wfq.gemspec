# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wfq/version'

Gem::Specification.new do |spec|
  spec.name          = "wfq"
  spec.version       = Wfq::VERSION
  spec.authors       = ["Josh Langholtz"]
  spec.email         = ["josh.langholtz@validic.com"]
  spec.summary       = %q{Word frequency count from a text file.}
  spec.description   = %q{Simple ruby program to count the word frequency in a file.}
  spec.homepage      = "https://www.github.com/jjlangholtz/wfq"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
