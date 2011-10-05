# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "truss/version"

Gem::Specification.new do |s|
  s.name        = "truss"
  s.version     = Truss::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carlos Ramirez III", "Ryan Jafari"]
  s.email       = ["carlos@cetrasoft.com", "ryan@cetrasoft.com"]
  s.homepage    = ""
  s.summary     = %q{A front-end framework built using the principles of OOCSS}
  s.description = %q{Truss is a framework inspired by the philosophy of Nicole Sullivan's Object-Oriented CSS.}

  s.rubyforge_project = "truss"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency('sass', '>= 3.1')
end
