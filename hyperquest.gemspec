# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "hyperquest"
  spec.version       = "0.1.0"
  spec.authors       = ["Bernardo Farah"]
  spec.email         = ["ber@bernardo.me"]

  spec.summary       = "A gem for asynchronous get requests, written in Go"
  spec.description   = "Hyperquest allows you to do an unlimited amount of "\
                       "HEAD or GET requests via a native extension."
  spec.homepage      = "https://github.com/berfarah/hyperquest"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end