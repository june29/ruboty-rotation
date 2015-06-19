lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruboty/rotation/version"

Gem::Specification.new do |spec|
  spec.name          = "ruboty-rotation"
  spec.version       = Ruboty::Rotation::VERSION
  spec.authors       = ["Jun OHWADA"]
  spec.email         = ["june29.jp@gmail.com"]
  spec.summary       = "Rotation management system for Ruboty"
  spec.homepage      = "https://github.com/june29/ruboty-rotation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty", ">= 0.2.0"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
