Gem::Specification.new do |gem|
  tag = `git describe --tags --abbrev=0`.chomp

  gem.name          = 'concourse-fuselage'
  gem.homepage      = 'https://github.com/colstrom/concourse-fuselage'
  gem.summary       = 'Framework for Concourse Resources'

  gem.version       = "#{tag}"
  gem.license       = ['MIT']
  gem.authors       = ['Chris Olstrom']
  gem.email         = 'chris@olstrom.com'

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = `git ls-files -z -- bin/*`.split("\x0").map { |f| File.basename(f) }
  gem.test_files    = `git ls-files -z -- {test,spec,features}/*`.split("\x0")

  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'contracts', '~> 0.13', '>= 0.13.0'
end
