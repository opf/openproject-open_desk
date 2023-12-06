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
            Rails.env.development?
          end

          protected

          def make_request
            <<~EOS
              {
                "categories": [
                  {
                    "identifier": "swp.groupware",
                    "display_name": "Communicate & organize",
                    "entries": [
                      {
                        "identifier": "swp.groupware_mail",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.groupware_mail.svg",
                        "display_name": "E-Mail",
                        "link": "https://webmail.nightly.istio.qa.souvap.cloud/appsuite/#app=io.ox/mail",
                        "target": "tab_groupware",
                        "keywords": {}
                      },
                      {
                        "identifier": "swp.groupware_calendar",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.groupware_calendar.svg",
                        "display_name": "Calendar",
                        "link": "https://webmail.nightly.istio.qa.souvap.cloud/appsuite/#app=io.ox/calendar",
                        "target": "tab_groupware",
                        "keywords": {}
                      },
                      {
                        "identifier": "swp.groupware_contacts",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.groupware_contacts.svg",
                        "display_name": "Contacts",
                        "link": "https://webmail.nightly.istio.qa.souvap.cloud/appsuite/#app=io.ox/contacts",
                        "target": "tab_groupware",
                        "keywords": {}
                      },
                      {
                        "identifier": "swp.groupware_tasks",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.groupware_tasks.svg",
                        "display_name": "Tasks",
                        "link": "https://webmail.nightly.istio.qa.souvap.cloud/appsuite/#app=io.ox/tasks",
                        "target": "tab_groupware",
                        "keywords": {}
                      }
                    ]
                  },
                  {
                    "identifier": "swp.fileshare",
                    "display_name": "Productivity",
                    "entries": [
                      {
                        "identifier": "swp.fileshare_files",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.fileshare_files.svg",
                        "display_name": "Files",
                        "link": "https://fs.nightly.qa.souvap.cloud/apps/files",
                        "target": "tab_fileshare",
                        "keywords": {}
                      },
                      {
                        "identifier": "swp.fileshare_activity",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.fileshare_activity.svg",
                        "display_name": "Activity",
                        "link": "https://fs.nightly.qa.souvap.cloud/apps/activity",
                        "target": "tab_fileshare",
                        "keywords": {}
                      }
                    ]
                  },
                  {
                    "identifier": "swp.management",
                    "display_name": "Management",
                    "entries": [
                      {
                        "identifier": "swp.management_project",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.management_project.svg",
                        "display_name": "Projects",
                        "link": "https://project.nightly.qa.souvap.cloud/auth/keycloak",
                        "target": "tab_projectmanagement",
                        "keywords": {}
                      },
                      {
                        "identifier": "swp.management_knowledge",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.management_knowledge.svg",
                        "display_name": "Knowledge",
                        "link": "https://wiki.nightly.qa.souvap.cloud",
                        "target": "tab_knowledgemanagement",
                        "keywords": {}
                      }
                    ]
                  },
                  {
                    "identifier": "swp.realtime",
                    "display_name": "Collaboration",
                    "entries": [
                      {
                        "identifier": "swp.realtime_collaboration",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.realtime_collaboration.svg",
                        "display_name": "Collaboration",
                        "link": "https://chat.nightly.qa.souvap.cloud",
                        "target": "tab_realtime_collaboration",
                        "keywords": {}
                      },
                      {
                        "identifier": "swp.realtime_videoconference",
                        "icon_url": "http://portal.nightly.qa.souvap.cloud/univention/portal/icons/entries/swp.realtime_videoconference.svg",
                        "display_name": "Ad hoc videoconference",
                        "link": "https://meet.nightly.qa.souvap.cloud",
                        "target": "tab_realtime_videoconference",
                        "keywords": {}
                      }
                    ]
                  }
                ]
              }
            EOS
          end
        end
      end
    end
  end
end
