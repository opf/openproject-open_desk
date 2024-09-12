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
require "rack/test"

RSpec.describe API::V3::LinkedApplications::LinkedApplicationsAPI, content_type: :json, type: :request do
  include Rack::Test::Methods
  include API::V3::Utilities::PathHelper

  let(:get_path) { api_v3_paths.linked_applications }
  let(:fixture_path) { File.expand_path("../../../../fixtures", __dir__) }
  let(:logged_out_response) { File.read File.join(fixture_path, "logged_out_response.json") }
  let(:logged_in_response) { File.read File.join(fixture_path, "logged_in_response.json") }

  shared_let(:user) { create :user, login: "my.username", language: "en" }
  current_user { user }

  context "when not configured" do
    it "returns a bad request error" do
      get get_path
      expect(last_response).to have_http_status 400
    end
  end

  context "when configured", :webmock,
          with_settings: { souvap_navigation_url: "http://stubbed.url/request", souvap_navigation_secret: "foo" } do
    let(:response_code) { 200 }
    let(:response_body) { logged_in_response }

    let(:locale) { "en-US" }
    let(:basic_auth) { Base64::encode64("my.username:foo").chomp }
    let(:request_headers) do
      {
        authorization: "Basic #{basic_auth}",
        accept: "application/json"
      }
    end

    let(:stub) do
      stub_request(:get, "http://stubbed.url/request?language=#{locale}")
        .with(
          headers: request_headers
        )
        .to_return(
          status: response_code,
          body: response_body
        )
    end

    it "returns the transformed API response" do
      stub
      get get_path

      expect(last_response).to have_http_status 200
      expect(stub).to have_been_requested

      body = JSON.parse(last_response.body)
      expect(body).to be_a Array
      expect(body.count).to eq 4
      identifiers = body.pluck("identifier")
      expect(identifiers).to contain_exactly("ux_groupware", "ux_fileshare", "Kollaboration", "help")

      collab = body.detect { |item| item["identifier"] == "Kollaboration" }
      expect(collab["items"]).to be_a Array
      expect(collab["items"].count).to eq 1
      expect(collab["items"][0]["name"]).to eq "Videoconference"
    end

    context "with other language" do
      let(:locale) { "de-DE" }

      it "maps that locale to the expected one" do
        user.update! language: "de"

        stub
        get get_path

        expect(last_response).to have_http_status 200
        expect(stub).to have_been_requested
      end
    end

    context "with error stub" do
      let(:stub) do
        stub_request(:get, "http://stubbed.url/request?language=en-US")
          .with(
            headers: request_headers
          )
          .to_return(
            status: 500,
            body: "Oh noes!"
          )
      end

      it "returns the error" do
        stub
        get get_path

        expect(last_response).to have_http_status 500
        expect(last_response.body).to eq "Failed to fetch openDesk central navigation data"
        expect(stub).to have_been_requested
      end
    end
  end
end
