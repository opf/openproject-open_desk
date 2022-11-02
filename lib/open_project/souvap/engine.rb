require 'active_support/dependencies'
require 'open_project/plugins'

module OpenProject::Souvap
  class Engine < ::Rails::Engine
    engine_name :openproject_Souvap

    include OpenProject::Plugins::ActsAsOpEngine

    patch_with_namespace :Redmine, :MenuManager, :TopMenuHelper

    assets %w(
      souvap/logo.svg
    )

    register(
      'openproject-souvap',
      :author_url => 'https://openproject.org',
    ) do
    end
  end
end
