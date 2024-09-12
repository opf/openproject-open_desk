$:.push File.expand_path("lib", __dir__)

require "open_project/open_desk/version"
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-open_desk"
  s.version     = OpenProject::OpenDesk::VERSION
  s.authors     = "OpenProject GmbH"
  s.email       = "info@openproject.org"
  s.homepage    = "https://community.openproject.org"
  s.summary     = "OpenProject OpenDesk Plugin"
  s.description = "Plugin for integrating OpenProject into openDesk"
  s.license     = "GPLv3"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(README.md)

  s.required_ruby_version = ">= 3.3.0"
  s.add_dependency "rails", "~> 7.0"
  s.metadata["rubygems_mfa_required"] = "true"
end
