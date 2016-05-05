# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "frontier_data_renderer/version"

Gem::Specification.new do |s|
  s.name        = "frontier_data_renderer"
  s.version     = FrontierDataRenderer::VERSION
  s.authors     = ["Jordan Maguire"]
  s.email       = ["jordan@thefrontiergroup.com.au"]
  s.homepage    = "https://github.com/thefrontiergroup/frontier_data_renderer"
  s.summary     = "Frontier Data Renderer provides a view helper to make rendering data on profile views or in tables easier."
  s.description = "Frontier Data Renderer provides a view helper to make rendering data on profile views or in tables easier."
  s.licenses    = ['MIT']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails" # doesn't run without rails, uses helpers

  s.add_development_dependency "byebug"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec_junit_formatter"
end
