# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reportabull/version"

Gem::Specification.new do |spec|
  spec.name          = "reportabull"
  spec.version       = Reportabull::VERSION
  spec.authors       = ["ihatov08"]
  spec.email         = ["ihatov08@gmail.com"]

  spec.summary       = %q{Easily export data.}
  spec.description   = %q{Easily export data your data objects.}
  spec.homepage      = "https://github.com/ihatov08/reportabull"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
