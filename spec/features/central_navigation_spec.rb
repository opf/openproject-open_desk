#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) the OpenProject GmbH
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
require_module_spec_helper

RSpec.describe "OpenDesk central navigation",
               :js,
               :webmock,
               with_settings: {
                 souvap_navigation_url: "http://stubbed.url/request",
                 souvap_navigation_secret: "foo"
               } do
  current_user { create(:admin, login: "testuser") }

  let(:fixture_path) { File.expand_path("../fixtures", __dir__) }
  let(:logged_in_response) { File.read File.join(fixture_path, "logged_in_response.json") }

  let(:locale) { "en-US" }
  let(:basic_auth) { Base64::encode64("testuser:foo").chomp }
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
        status: 200,
        body: logged_in_response
      )
  end

  it "opens the central navigation" do
    stub

    visit home_path

    click_link_or_button "openDesk navigation"

    expect(page).to have_css(".op-opendesk-navigation--group", count: 5)
    expect(page).to have_css(".op-opendesk-navigation--item", text: "Email")
    expect(page).to have_css(".op-opendesk-navigation--item", text: "Calendar")
    expect(page).to have_css(".op-opendesk-navigation--item", text: "Contacts")
    expect(page).to have_css(".op-opendesk-navigation--item", text: "Tasks")

    expect(page).to have_css(".op-opendesk-navigation--item", text: "Files")
    expect(page).to have_css(".op-opendesk-navigation--item", text: "Activity")
    expect(page).to have_css(".op-opendesk-navigation--item", text: "Project management")
    expect(page).to have_css(".op-opendesk-navigation--item", text: "Videoconference")
  end
end
