#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) 2012-2022 the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See COPYRIGHT and LICENSE files for more details.
#++
require "spec_helper"

RSpec.describe API::V3::LinkedApplications::Adapters::OpenDesk do
  let(:login) { "foo" }
  let(:language) { "de" }
  let(:user) { build(:user, login:, language:) }

  let(:session) { double(Sessions::UserSession, id: "session-of-foo") } # rubocop:disable RSpec/VerifiedDoubles
  let(:service_double) { instance_double(OpenDesk::CentralNavigationService) }
  let(:instance) { described_class.new(user:, session:) }

  before do
    allow(OpenDesk::CentralNavigationService)
      .to(receive(:new))
      .with(login, language)
      .and_return(service_double)
  end

  describe ".applicable?" do
    subject { described_class.applicable? }

    it "returns false if not configured",
       with_settings: { souvap_navigation_url: nil } do
      expect(subject).to be false
    end

    it "returns false if partially configured",
       with_settings: { souvap_navigation_url: "bla", souvap_navigation_secret: nil } do
      expect(subject).to be false
    end

    it "returns false if fully configured",
       with_settings: { souvap_navigation_url: "bla", souvap_navigation_secret: "foo" } do
      expect(subject).to be true
    end
  end

  describe "#fetch_entries" do
    let(:fixture_path) { File.expand_path("../../../../../fixtures", __dir__) }
    let(:logged_out_response) { File.read File.join(fixture_path, "logged_out_response.json") }

    subject { instance.fetch_entries }

    context "when not cached" do
      it "calls the service" do
        allow(service_double).to receive(:call).and_return ServiceResult.success(result: logged_out_response)

        expect(subject).to be_a Array
        expect(subject[0].name).to eq "openDesk"
        expect(subject[0].items).to be_a Array

        item = subject[0].items.first
        expect(item.identifier).to eq "Anmeldung"
        expect(item.name).to eq "Login"
        expect(item.icon).to be_present
        expect(item.link).to be_present

        expect(service_double).to have_received(:call)
      end
    end

    context "when cached" do
      before do
        Rails.cache.write("open_desk/navigation-items/session-of-foo-de", '{ "categories": [] }')
      end

      context "with switched language" do
        let(:language) { "en" }

        it "does call the API" do
          allow(service_double).to receive(:call).and_return(ServiceResult.success(result: '{ "categories": [] }'))

          expect(subject).to eq []

          expect(service_double).to have_received(:call)
        end
      end

      it "does not call the API" do
        allow(service_double).to receive(:call)

        expect(subject).to eq []

        expect(service_double).not_to have_received(:call)
      end
    end
  end
end
