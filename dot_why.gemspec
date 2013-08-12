
Gem::Specification.new do |s|
  s.name        = 'dot_why'
  s.version     = '0.0.1'
  s.date        = '2013-08-12'
  s.summary     = "Erector to create other templates."
  s.description = "Use of Erector to generate various types of templates."
  s.authors     = ["da99"]
  s.email       = 'da99@da99'
  s.executables = `ls bin/`.split("\n")
  s.files       = `ls lib/`.split("\n").map { |f| "lib/#{f}" }
  s.homepage    =
    'http://www.github.com/da99/dot_why'
  s.license       = 'MIT'

  # s.require_paths = ["lib"]
  s.add_runtime_dependency 'erector'
  s.add_runtime_dependency 'active_support'
end
