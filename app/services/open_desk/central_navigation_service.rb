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

module OpenDesk
  class CentralNavigationService
    attr_reader :login, :locale

    def initialize(login, language)
      @login = login
      @locale = map_locale(language.presence || "en")
    end

    def call
      ServiceResult.success(result: make_request)
    rescue StandardError => e
      ServiceResult.failure(message: e.message)
    end

    private

    def map_locale(language)
      {
        "en" => "en-US",
        "de" => "de-DE",
        "fr" => "fr-FR"
      }.fetch(language.to_s, "en-US")
    end

    def make_request
      Rails.logger.debug { "Performing souvap request for #{login} with locale #{locale}." }
      uri = URI.parse(Setting.souvap_navigation_url)
      uri.query = URI.encode_www_form({ language: locale })
      response = Net::HTTP.get_response(
        uri,
        {
          "Accept" => "application/json",
          "Authorization" => "Basic #{credentials}"
        }
      )

      case response
      when Net::HTTPSuccess
        response.body
      else
        Rails.logger.error "Failed to perform open_desk navigation request: #{response.code}"
        raise "Failed to fetch openDesk central navigation data"
      end
    end

    def credentials
      shared_secret = Setting.souvap_navigation_secret
      Base64::strict_encode64("#{login}:#{shared_secret}")
    end
  end
end
