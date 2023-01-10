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
        class Souvap < Base
          def self.applicable?
            !!(Setting.souvap_navigation_url && Setting.souvap_navigation_secret)
          end

          protected

          def make_request
            Rails.cache.fetch("souvap/navigation-items/#{session.id}", expires_in: 1.minute) do
              ::Souvap::CentralNavigationService
                .new(user.login, user.language)
                .call
                .on_failure { |result| raise result.message }
                .result
            end
          end

          def transform(json)
            json['categories'].filter_map do |group|
              next if group['identifier'] == 'ux_management'
              items = group['entries'].map { |item| parse_item(item) }
              ::Souvap::ApplicationGroup.new identifier: group['identifier'],
                                             name: group['display_name'],
                                             items:
            end
          end

          def parse_item(json)
            ::Souvap::LinkedApplication
              .new({
                     identifier: json['identifier'],
                     icon: json['icon_url'],
                     link: json['link'],
                     name: json['display_name']
                   })
          end
        end
      end
    end
  end
end
