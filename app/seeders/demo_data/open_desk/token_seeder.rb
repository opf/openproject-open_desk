module DemoData
  module OpenDesk
    class TokenSeeder < Seeder
      def seed_data!
        puts "*** Seeding openDesk license from ENV"

        token = Setting.enterprise_token
        if token.present?
          EnterpriseToken.create! encoded_token: token.gsub("\\n", "\n")
        end
      end

      def applicable?
        !EnterpriseToken.exists?
      end
    end
  end
end
