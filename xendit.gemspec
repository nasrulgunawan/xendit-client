# frozen_string_literal: true

require_relative "lib/xendit/version"

Gem::Specification.new do |spec|
  spec.name = "xendit"
  spec.version = Xendit::VERSION
  spec.authors = ["Nasrul Gunawan"]
  spec.email = ["search.nasrul@gmail.com"]

  spec.summary = "Xendit Ruby Client Library"
  spec.homepage = "https://github.com/nasrulgunawan/xendit-client"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

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

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday", "~> 2.7.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
