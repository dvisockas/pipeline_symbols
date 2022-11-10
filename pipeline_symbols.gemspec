# frozen_string_literal: true

require_relative "lib/pipeline_symbols/version"
require_relative "lib/pipeline_symbols"

Gem::Specification.new do |spec|
  spec.name = "pipeline_symbols"
  spec.version = PipelineSymbols::VERSION
  spec.authors = ["Danielius Visockas"]
  spec.email = ["danieliusvisockas@gmail.com"]

  spec.summary = "Chain symbols as it they are callable"
  spec.homepage = "https://github.com/dvisockas/pipeline_symbols"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/dvisockas/pipeline_symbols'
  spec.metadata['changelog_uri'] = 'https://github.com/dvisockas/pipeline_symbols/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
