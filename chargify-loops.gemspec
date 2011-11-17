# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'chargify/loops/version'

Gem::Specification.new do |s|
  s.name        = 'chargify-loops'
  s.version     = Chargify::Loops::VERSION
  s.authors     = ['Pat Allan']
  s.email       = ['pat@freelancing-gods.com']
  s.homepage    = 'https://github.com/freelancing-god/chargify-loops'
  s.summary     = %q{A Rails Engine for Chargify Webhooks}
  s.description = %q{A Rails Engine that handles Chargify Webhooks requests and validates and forwards them off to registered loops.}

  s.rubyforge_project = 'chargify-loops'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f|
    File.basename(f)
  }
  s.require_paths = ['lib']

  s.add_runtime_dependency     'rails',       '~> 3.0'
  s.add_development_dependency 'rspec-rails', '2.7.0'
end
