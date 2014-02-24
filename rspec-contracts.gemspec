require File.expand_path("../lib/rspec/contracts/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "rspec-contracts"
  s.version = RSpec::Contracts::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Brian Auton"]
  s.email = ["brianauton@gmail.com"]
  s.homepage = "http://github.com/brianauton/rspec-contracts"
  s.summary = "Automatic contract checking for your RSpec suite"
  s.license = "MIT"
  s.required_rubygems_version = ">= 1.3.6"
  s.files = Dir.glob("lib/**/*") + ["README.md", "History.md", "License.txt"]
  s.require_path = "lib"
  s.add_dependency "rspec", "3.0.0.beta2"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rake"
end
