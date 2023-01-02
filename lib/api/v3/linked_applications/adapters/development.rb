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
        class Development < Souvap
          def self.applicable?
            Rails.env.development?
          end

          protected

          def make_request
            <<~EOS
              {
                  "categories": [{
                      "identifier": "ux_groupware",
                      "display_name": "Groupware",
                      "entries": [{
                          "identifier": "gw_mail",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0iTTcgNDBxLTEuMiAwLTIuMS0uOVE0IDM4LjIgNCAzN1YxMXEwLTEuMi45LTIuMVE1LjggOCA3IDhoMzRxMS4yIDAgMi4xLjkuOS45LjkgMi4xdjI2cTAgMS4yLS45IDIuMS0uOS45LTIuMS45Wm0xNy0xNS4xTDcgMTMuNzVWMzdoMzRWMTMuNzVabTAtM0w0MC44IDExSDcuMjVaTTcgMTMuNzVWMTF2MjZaIiBmaWxsPSIjNTc1NzU3Ii8+PC9zdmc+",
                          "display_name": "Email",
                          "link": "https://webmail.example.com/appsuite/#app=io.ox/mail",
                          "target": "tab_groupware",
                          "keywords": []
                      }, {
                          "identifier": "gw_calendar",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0iTTkgNDRxLTEuMiAwLTIuMS0uOVE2IDQyLjIgNiA0MVYxMHEwLTEuMi45LTIuMVE3LjggNyA5IDdoMy4yNVY0aDMuMjV2M2gxN1Y0aDMuMjV2M0gzOXExLjIgMCAyLjEuOS45LjkuOSAyLjF2MzFxMCAxLjItLjkgMi4xLS45LjktMi4xLjlabTAtM2gzMFYxOS41SDlWNDFabTAtMjQuNWgzMFYxMEg5Wm0wIDBWMTB2Ni41Wk0yNCAyOHEtLjg1IDAtMS40MjUtLjU3NVEyMiAyNi44NSAyMiAyNnEwLS44NS41NzUtMS40MjVRMjMuMTUgMjQgMjQgMjRxLjg1IDAgMS40MjUuNTc1UTI2IDI1LjE1IDI2IDI2cTAgLjg1LS41NzUgMS40MjVRMjQuODUgMjggMjQgMjhabS04IDBxLS44NSAwLTEuNDI1LS41NzVRMTQgMjYuODUgMTQgMjZxMC0uODUuNTc1LTEuNDI1UTE1LjE1IDI0IDE2IDI0cS44NSAwIDEuNDI1LjU3NVExOCAyNS4xNSAxOCAyNnEwIC44NS0uNTc1IDEuNDI1UTE2Ljg1IDI4IDE2IDI4Wm0xNiAwcS0uODUgMC0xLjQyNS0uNTc1UTMwIDI2Ljg1IDMwIDI2cTAtLjg1LjU3NS0xLjQyNVEzMS4xNSAyNCAzMiAyNHEuODUgMCAxLjQyNS41NzVRMzQgMjUuMTUgMzQgMjZxMCAuODUtLjU3NSAxLjQyNVEzMi44NSAyOCAzMiAyOFptLTggOHEtLjg1IDAtMS40MjUtLjU3NVEyMiAzNC44NSAyMiAzNHEwLS44NS41NzUtMS40MjVRMjMuMTUgMzIgMjQgMzJxLjg1IDAgMS40MjUuNTc1UTI2IDMzLjE1IDI2IDM0cTAgLjg1LS41NzUgMS40MjVRMjQuODUgMzYgMjQgMzZabS04IDBxLS44NSAwLTEuNDI1LS41NzVRMTQgMzQuODUgMTQgMzRxMC0uODUuNTc1LTEuNDI1UTE1LjE1IDMyIDE2IDMycS44NSAwIDEuNDI1LjU3NVExOCAzMy4xNSAxOCAzNHEwIC44NS0uNTc1IDEuNDI1UTE2Ljg1IDM2IDE2IDM2Wm0xNiAwcS0uODUgMC0xLjQyNS0uNTc1UTMwIDM0Ljg1IDMwIDM0cTAtLjg1LjU3NS0xLjQyNVEzMS4xNSAzMiAzMiAzMnEuODUgMCAxLjQyNS41NzVRMzQgMzMuMTUgMzQgMzRxMCAuODUtLjU3NSAxLjQyNVEzMi44NSAzNiAzMiAzNloiIGZpbGw9IiM1NzU3NTciLz48L3N2Zz4=",
                          "display_name": "Calendar",
                          "link": "https://webmail.example.com/appsuite/#app=io.ox/calendar",
                          "target": "tab_groupware",
                          "keywords": []
                      }, {
                          "identifier": "gw_contacts",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0iTTI0IDI4cTEuNjUgMCAyLjgyNS0xLjE3NVEyOCAyNS42NSAyOCAyNHEwLTEuNjUtMS4xNzUtMi44MjVRMjUuNjUgMjAgMjQgMjBxLTEuNjUgMC0yLjgyNSAxLjE3NVEyMCAyMi4zNSAyMCAyNHEwIDEuNjUgMS4xNzUgMi44MjVRMjIuMzUgMjggMjQgMjhabS04IDhoMTZ2LTEuMTVxMC0xLjItLjY1LTIuMi0uNjUtMS0xLjgtMS41LTEuMy0uNTUtMi42NzUtLjg1UTI1LjUgMzAgMjQgMzB0LTIuODc1LjNxLTEuMzc1LjMtMi42NzUuODUtMS4xNS41LTEuOCAxLjUtLjY1IDEtLjY1IDIuMlptMjEgOEgxMXEtMS4yIDAtMi4xLS45UTggNDIuMiA4IDQxVjdxMC0xLjIuOS0yLjFROS44IDQgMTEgNGgxNy4wNUw0MCAxNS45NVY0MXEwIDEuMi0uOSAyLjEtLjkuOS0yLjEuOVptMC0zVjE3LjNMMjYuNyA3SDExdjM0Wm0tMjYgMFY3djM0WiIgZmlsbD0iIzU3NTc1NyIvPjwvc3ZnPg==",
                          "display_name": "Contacts",
                          "link": "https://webmail.example.com/appsuite/#app=io.ox/contacts",
                          "target": "tab_groupware",
                          "keywords": []
                      }, {
                          "identifier": "gw_tasks",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0iTTQgMzMuNXYtM2gxOHYzWm0wLTE2di0zaDE4djNabTI4Ljk1IDE5LjgtNy4xLTcuMSAyLjEtMi4xIDUgNC45NSA4Ljk1LTguOTUgMi4xIDIuMTVabTAtMTYtNy4xLTcuMSAyLjEtMi4xIDUgNC45NUw0MS45IDguMWwyLjEgMi4xNVoiIGZpbGw9IiM1NzU3NTciLz48L3N2Zz4=",
                          "display_name": "Tasks",
                          "link": "https://webmail.example.com/appsuite/#app=io.ox/tasks",
                          "target": "tab_groupware",
                          "keywords": []
                      }]
                  }, {
                      "identifier": "ux_fileshare",
                      "display_name": "Fileshare",
                      "entries": [{
                          "identifier": "fs_files",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0iTTcgNDBxLTEuMTUgMC0yLjA3NS0uOTI1UTQgMzguMTUgNCAzN1YxMXEwLTEuMTUuOTI1LTIuMDc1UTUuODUgOCA3IDhoMTQuMDVsMyAzSDQxcTEuMTUgMCAyLjA3NS45MjVRNDQgMTIuODUgNDQgMTRIMjIuNzVsLTMtM0g3djI2bDUuMS0yMEg0N2wtNS4zNSAyMC43cS0uMyAxLjItMS4xIDEuNzVUMzguNSA0MFptMy4xNS0zaDI4LjZsNC4yLTE3aC0yOC42Wm0wIDAgNC4yLTE3LTQuMiAxN1pNNyAxNHYtMyAzWiIgZmlsbD0iIzU3NTc1NyIvPjwvc3ZnPg==",
                          "display_name": "Files",
                          "link": "https://fs.dpx-openproject.example.com/apps/files",
                          "target": "tab_fileshare",
                          "keywords": []
                      }, {
                          "identifier": "fs_activity",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0ibTI0IDI4LjggMi40NS01LjM1TDMxLjggMjFsLTUuMzUtMi40NUwyNCAxMy4ybC0yLjQ1IDUuMzVMMTYuMiAyMWw1LjM1IDIuNDVaTTcgMzZxLTEuMiAwLTIuMS0uOVE0IDM0LjIgNCAzM1Y5cTAtMS4yLjktMi4xUTUuOCA2IDcgNmgzNHExLjIgMCAyLjEuOS45LjkuOSAyLjF2MjRxMCAxLjItLjkgMi4xLS45LjktMi4xLjlabTAtM2gzNFY5SDd2MjRabTAgMFY5djI0Wm0tMy41IDlxLS42NSAwLTEuMDc1LS40MjVRMiA0MS4xNSAyIDQwLjVxMC0uNjUuNDI1LTEuMDc1UTIuODUgMzkgMy41IDM5aDQxcS42NSAwIDEuMDc1LjQyNVE0NiAzOS44NSA0NiA0MC41cTAgLjY1LS40MjUgMS4wNzVRNDUuMTUgNDIgNDQuNSA0MloiIGZpbGw9IiM1NzU3NTciLz48L3N2Zz4=",
                          "display_name": "Activity",
                          "link": "https://fs.dpx-openproject.example.com/apps/activity",
                          "target": "tab_fileshare",
                          "keywords": []
                      }]
                  }, {
                      "identifier": "Kollaboration",
                      "display_name": "Collaboration",
                      "entries": [{
                          "identifier": "dpx-openproject.Videokonferenzen",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0iTTQgMzRWNi4xcTAtLjcuNjUtMS40VDYgNGgyNS45NXEuNzUgMCAxLjQuNjc1UTM0IDUuMzUgMzQgNi4xdjE3LjhxMCAuNy0uNjUgMS40dC0xLjQuN0gxMlptMTAuMDUgMnEtLjcgMC0xLjM3NS0uN1QxMiAzMy45VjI5aDI1VjEyaDVxLjcgMCAxLjM1LjcuNjUuNy42NSAxLjQ1djI5LjhMMzYuMDUgMzZaTTMxIDdIN3YxOS43NUwxMC43NSAyM0gzMVpNNyA3djE5Ljc1WiIgZmlsbD0iIzU3NTc1NyIvPjwvc3ZnPg==",
                          "display_name": "Videoconference",
                          "link": "https://collab.example.com",
                          "target": "_blank",
                          "keywords": []
                      }]
                  }, {
                      "identifier": "help",
                      "display_name": "Help",
                      "entries": [{
                          "identifier": "Documentation",
                          "icon_url": "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iNDgiIHdpZHRoPSI0OCI+PHBhdGggZD0iTTI4IDE5LjN2LTIuNHExLjY1LS43IDMuMzc1LTEuMDVRMzMuMSAxNS41IDM1IDE1LjVxMS4zIDAgMi41NS4yIDEuMjUuMiAyLjQ1LjV2Mi4ycS0xLjItLjQ1LTIuNDI1LS42NzVRMzYuMzUgMTcuNSAzNSAxNy41cS0xLjkgMC0zLjY1LjQ3NVQyOCAxOS4zWm0wIDExdi0yLjQ1cTEuNjUtLjcgMy4zNzUtMS4wMjVRMzMuMSAyNi41IDM1IDI2LjVxMS4zIDAgMi41NS4yIDEuMjUuMiAyLjQ1LjV2Mi4ycS0xLjItLjQ1LTIuNDI1LS42NzVRMzYuMzUgMjguNSAzNSAyOC41cS0xLjkgMC0zLjY1LjQ1VDI4IDMwLjNabTAtNS41di0yLjRxMS42NS0uNyAzLjM3NS0xLjA1UTMzLjEgMjEgMzUgMjFxMS4zIDAgMi41NS4yIDEuMjUuMiAyLjQ1LjV2Mi4ycS0xLjItLjQ1LTIuNDI1LS42NzVRMzYuMzUgMjMgMzUgMjNxLTEuOSAwLTMuNjUuNDc1VDI4IDI0LjhaTTEyLjQgMzNxMi43IDAgNS4yMjUuNjI1IDIuNTI1LjYyNSA0Ljk3NSAxLjg3NVYxNC4xNXEtMi4yNS0xLjUtNC44NzUtMi4zMjVRMTUuMSAxMSAxMi40IDExcS0xLjkgMC0zLjcyNS40NzVRNi44NSAxMS45NSA1IDEyLjY1djIxLjdxMS41NS0uNyAzLjUyNS0xLjAyNVExMC41IDMzIDEyLjQgMzNabTEzLjIgMi41cTIuNS0xLjI1IDQuOS0xLjg3NVEzMi45IDMzIDM1LjYgMzNxMS45IDAgMy45MjUuM3QzLjQ3NS44VjEyLjY1cS0xLjctLjg1LTMuNi0xLjI1LTEuOS0uNC0zLjgtLjQtMi43IDAtNS4yMjUuODI1LTIuNTI1LjgyNS00Ljc3NSAyLjMyNVpNMjQuMSA0MHEtMi41NS0xLjktNS41NS0yLjkyNVQxMi40IDM2LjA1cS0xLjg1IDAtMy42LjQ1dC0zLjUgMS4xcS0xLjE1LjU1LTIuMjI1LS4xNVEyIDM2Ljc1IDIgMzUuNDVWMTIuM3EwLS43NS4zNS0xLjM3NVQzLjQgOS45NXEyLjEtMSA0LjM3NS0xLjQ3NVExMC4wNSA4IDEyLjQgOHEzLjE1IDAgNi4xMjUuODV0NS41NzUgMi42cTIuNTUtMS43NSA1LjQ3NS0yLjZRMzIuNSA4IDM1LjYgOHEyLjM1IDAgNC42LjQ3NSAyLjI1LjQ3NSA0LjM1IDEuNDc1LjcuMzUgMS4wNzUuOTc1VDQ2IDEyLjN2MjMuMTVxMCAxLjQtMS4xMjUgMi4xMjUtMS4xMjUuNzI1LTIuMjI1LjAyNS0xLjctLjctMy40NS0xLjEyNS0xLjc1LS40MjUtMy42LS40MjUtMy4xNSAwLTYuMDUgMS4wNVQyNC4xIDQwWk0xMy44IDIzLjU1WiIgZmlsbD0iIzU3NTc1NyIvPjwvc3ZnPg==",
                          "display_name": "Documentation",
                          "link": "http://openproject.com/docs",
                          "target": "_blank",
                          "keywords": []
                      }]
                  }]
              }
            EOS
          end
        end
      end
    end
  end
end
