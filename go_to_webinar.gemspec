# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "go_to_webinar/version"

Gem::Specification.new do |spec|
  spec.name          = "go_to_webinar"
  spec.version       = GoToWebinar::VERSION
  spec.authors       = ["Danilo Jeremias da Silva"]
  spec.email         = ["daniloj.dasilva@gmail.com"]

  spec.summary       = %q{Client for Go To Webinar API.}
  spec.description   = %q{Client for Go To Webinar API.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client","~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "webmock", "~> 3.0"
end
