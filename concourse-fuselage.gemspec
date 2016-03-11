Gem::Specification.new do |gem|
  gem.name          = 'concourse-fuselage'
  gem.version       = '0.5.2'
  gem.authors       = ['Chris Olstrom']
  gem.license       = 'Apache-2.0'
  gem.summary       = 'Framework for Concourse Resources'

  gem.email         = 'chris@olstrom.com'
  gem.homepage      = 'https://github.com/colstrom/concourse-fuselage'

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'contracts', '~> 0.13', '>= 0.13.0'
end
