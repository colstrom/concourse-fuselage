Gem::Specification.new do |gem|
  gem.name          = 'concourse-fuselage'
  gem.version       = '0.3.0'
  gem.authors       = ['Chris Olstrom']
  gem.email         = 'chris@olstrom.com'
  gem.license       = 'MIT'
  gem.summary       = 'Helpers for Concourse Resources'
  gem.description   = 'Helper classes and methods for implementing Concourse Resources'

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'contracts', '~> 0.13', '>= 0.13.0'
end
