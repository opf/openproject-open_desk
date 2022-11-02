# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/souvap/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-souvap"
  s.version     = OpenProject::Souvap::VERSION
  s.authors     = "OpenProject GmbH"
  s.email       = "info@openproject.org"
  s.homepage    = "https://community.openproject.org"
  s.summary     = 'OpenProject Souvap Plugin'
  s.description = "Plugin for integrating OpenProject into dSouvapSuite / Sovereign work place"
  s.license     = "GPLv3"

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(README.md)

  s.add_dependency "rails", '~> 7.0'
end
