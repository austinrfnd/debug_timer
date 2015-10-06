# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'debug_timer/version'

Gem::Specification.new do |spec|
  spec.name          = "debug_timer"
  spec.version       = DebugTimer::VERSION
  spec.authors       = ["Jorge Urias", "Austin Fonacier"]
  spec.email         = ["jurias@spokeo.com", "austinrf@gmail.com"]
  spec.summary       = "When RubyProf has failed you, time your individual code components."
  spec.description   = "Nest code blocks and time them easily to grab a greater insight on what is happening to your code."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "3.3.0"
end
