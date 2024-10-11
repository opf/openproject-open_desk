module DemoData
  module OpenDesk
    class ThemeSeeder < Seeder
      def seed_data! # rubocop:disable Metrics/AbcSize
        Rails.logger.debug "*** Seeding openDesk specifics"

        theme = OpenProject::CustomStyles::ColorThemes.themes.find do |t|
          t[:theme] == OpenProject::CustomStyles::ColorThemes::OPEN_DESK_THEME_NAME
        end

        ::Design::UpdateDesignService
          .new(theme)
          .call

        custom_style = CustomStyle.current
        custom_style.logo = File.new(OpenProject::OpenDesk::Engine.root.join("app", "assets", "images", "open_desk", "logo.svg"))
        custom_style.favicon = File.new(OpenProject::OpenDesk::Engine.root.join("app", "assets", "images", "open_desk",
                                                                                "favicon.svg"))
        custom_style.save!
        custom_style.touch
      end

      def applicable?
        DesignColor.all.empty?
      end
    end
  end
end
