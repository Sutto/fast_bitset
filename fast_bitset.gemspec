# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fast_bitset/version'

Gem::Specification.new do |spec|
  spec.name          = "fast_bitset"
  spec.version       = FastBitset::VERSION
  spec.authors       = ["Darcy Laycock", "Matt Delves", "Matt Allen"]
  spec.email         = ["sutto@sutto.net"]
  spec.summary       = %q{Fast Bit String to Ruby Arrays of IDs, using C for magical speediness. Perfect for use with Redis Bit sets}
  spec.homepage      = "https://github.com/Sutto/fast_bitset"
  spec.license       = "MIT"

  spec.platform      = Gem::Platform::RUBY
  spec.extensions    = Dir["ext/**/extconf.rb"]

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", "~> 2.0"
end
