module DemoData
  class SouvapThemeSeeder < Seeder
    def seed_data!
      puts "*** Seeding Souvap specifics"

      theme = OpenProject::CustomStyles::ColorThemes.themes.find do |t|
        t[:theme] == OpenProject::CustomStyles::ColorThemes::SOUVAP_THEME_NAME
      end

      ::Design::UpdateDesignService
        .new(theme)
        .call
    end

    def applicable?
      DesignColor.all.empty?
    end
  end
end
