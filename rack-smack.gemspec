# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/smack/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-smack'
  spec.version       = Rack::Smack::VERSION
  spec.authors       = ['AlessandroMinali']
  spec.email         = ['alessandro.minali@gmail.com']

  spec.summary       = 'A no-nonsense force of good in a world of bad. Will prevent malicious bots/users from accessing your content once they are caught red-handed.'
  spec.homepage      = 'https://github.com/AlessandroMinali/rack-smack'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", ">= 2.1.0"
  spec.add_development_dependency "rake",     '>= 12.3.3'
  spec.add_development_dependency 'rspec',    '~> 3.2'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'pry'
end
