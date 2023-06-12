module DemoData
  module Souvap
    class SouvapThemeSeeder < Seeder
      def seed_data!
        puts "*** Seeding Souvap specifics"

        theme = OpenProject::CustomStyles::ColorThemes.themes.find do |t|
          t[:theme] == OpenProject::CustomStyles::ColorThemes::SOUVAP_THEME_NAME
        end

        ::Design::UpdateDesignService
          .new(theme)
          .call

        custom_style = CustomStyle.current
        custom_style.logo = File.new(OpenProject::Souvap::Engine.root.join('app', 'assets', 'images', 'souvap', 'logo.svg'))
        custom_style.favicon = File.new(OpenProject::Souvap::Engine.root.join('app', 'assets', 'images', 'souvap', 'favicon.ico'))
        custom_style.save!
        custom_style.touch
      end

      def applicable?
        DesignColor.all.empty?
      end
    end
  end
end
