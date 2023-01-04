module DemoData
  module Souvap
    class SouvapTokenSeeder < Seeder
      def seed_data!
        puts "*** Seeding Souvap license from ENV"

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
