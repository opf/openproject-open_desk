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
OpenProject::CustomStyles::ColorThemes::OPEN_DESK_THEME_NAME = 'openDesk'.freeze

module OpenProject::OpenDesk::Patches
  module ColorThemesPatch
    def self.included(base)
      base.singleton_class.prepend InstanceMethods
    end

    module InstanceMethods
      def themes
        super + [open_desk_theme]
      end

      def open_desk_theme
        {
          theme: OpenProject::CustomStyles::ColorThemes::OPEN_DESK_THEME_NAME,
          colors: {
            "primary-color": "#52C1FF",
            "primary-color-dark": "#003451",
            "alternative-color": "#5E27DD",
            "content-link-color": "#095AD2",
            "header-bg-color": "#FAFAFA",
            "header-border-bottom-color": "#E1E1E1",
            "header-item-bg-hover-color": "#5e27dd",
            "header-item-font-color": "#313131",
            "header-item-font-hover-color": "#EAEAEA",
            "main-menu-border-color": "#5e27dd",
            "main-menu-bg-color": "#ECECEC",
            "main-menu-bg-hover-background": "#5e27dd",
            "main-menu-bg-selected-background": "#ffffff",
            "main-menu-font-color": "#000000",
            "main-menu-hover-font-color": "#EAEAEA",
            "main-menu-selected-font-color": "#000000"
          }
        }
      end
    end
  end
end
