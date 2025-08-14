# frozen_string_literal: true

require_relative "lib/ordinary_rails_wa_components/version"

Gem::Specification.new do |spec|
  spec.name        = "ordinary_rails_wa_components"
  spec.version     = OrdinaryRailsWaComponents::VERSION
  spec.authors     = ["Wei Zhe Heng"]
  spec.email       = ["marcushwz@gmail.com"]
  spec.homepage    = "TODO"
  spec.summary     = "TODO: Summary of OrdinaryRailsWaComponents."
  spec.description = "TODO: Description of OrdinaryRailsWaComponents."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.2"
  spec.add_dependency "view_component", "~> 3.0" # Add ViewComponent
  spec.add_dependency "stimulus-rails", ">= 1.0.0"
  # spec.add_dependency "hotwire_combobox", "~> 0.4.0"
end
