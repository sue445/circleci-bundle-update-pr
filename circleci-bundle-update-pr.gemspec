# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'circleci/bundle/update/pr/version'

Gem::Specification.new do |spec|
  spec.name          = 'circleci-bundle-update-pr'
  spec.version       = Circleci::Bundle::Update::Pr::VERSION
  spec.authors       = ['Takashi Masuda']
  spec.email         = ['masutaka.net@gmail.com']
  spec.summary       = 'Provide continues bundle update using CircleCI'
  spec.description   = 'Create GitHub PullRequest of bundle update in CircleCI'
  spec.homepage      = 'https://github.com/masutaka/circleci-bundle-update-pr'
  spec.license       = 'MIT'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_dependency 'compare_linker', '>= 1.4.0'
  spec.add_dependency 'octokit'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'parallel', '< 1.20.0' # parallel-1.20.0 requires ruby version >= 2.5, which used by rubocop
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
end
