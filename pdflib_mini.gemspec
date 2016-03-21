# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdflib_mini/version'

Gem::Specification.new do |spec|
  spec.name          = "pdflib_mini"
  spec.version       = PdflibMini::VERSION
  spec.authors       = ["Takumi IINO"]
  spec.email         = ["trot.thunder@gmail.com"]

  spec.summary       = %q{Mini wrapper for PDFlib.}
  spec.description   = %q{Mini wrapper for PDFlib.}
  spec.homepage      = "https://github.com/troter/pdflib_mini"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
