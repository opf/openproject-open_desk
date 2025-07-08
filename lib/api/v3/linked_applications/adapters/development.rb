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

module API
  module V3
    module LinkedApplications
      module Adapters
        class Development < OpenDesk
          def self.applicable?
            Rails.env.development? || Rails.env.test?
          end

          protected

          def make_request
            <<~ENTRIES
              {

                "categories": [
                  {
                    "identifier": "od.applications",
                    "display_name": "Anwendungen",
                    "entries": [
                      {
                          "identifier": "swp.fileshare_files",
                          "icon_url": "https://portal.opendesk.family/univention/portal/icons/entries/swp.fileshare_files.svg",
                          "display_name": "Dateien",
                          "link": "https://fs.opendesk.family/apps/files"
                      },
                      {
                          "identifier": "swp.management_project",
                          "icon_url": "https://portal.opendesk.family/univention/portal/icons/entries/swp.management_project.svg",
                          "display_name": "Projekte",
                          "link": "https://project.opendesk.family/auth/keycloak"
                      },
                      {
                          "identifier": "custon.openproject.meetings",
                          "icon_url": "https://portal.opendesk.family/univention/portal/icons/entries/custon.openproject.meetings.svg",
                          "display_name": "Projekte \u003e Meetings",
                          "link": "https://project.opendesk.family/meetings"
                      },
                      {
                          "identifier": "swp.management_knowledge",
                          "icon_url": "https://portal.opendesk.family/univention/portal/icons/entries/swp.management_knowledge.svg",
                          "display_name": "Wissen",
                          "link": "https://wiki.opendesk.family"
                      },
                      {
                          "identifier": "swp.realtime_videoconference",
                          "icon_url": "https://portal.opendesk.family/univention/portal/icons/entries/swp.realtime_videoconference.svg",
                          "display_name": "Video-Konferenz",
                          "link": "https://meet.opendesk.family"
                      },
                      {
                          "identifier": "swp.realtime_collaboration",
                          "icon_url": "https://portal.opendesk.family/univention/portal/icons/entries/swp.realtime_collaboration.svg",
                          "display_name": "Chat",
                          "link": "https://chat.opendesk.family"
                      },
                      {
                          "identifier": "swp.notes",
                          "icon_url": "https://portal.opendesk.family/univention/portal/icons/entries/swp.notes.svg",
                          "display_name": "Notizen",
                          "link": "https://notes.opendesk.family"
                      }
                    ]
                  }
                ]
              }
            ENTRIES
          end
        end
      end
    end
  end
end
