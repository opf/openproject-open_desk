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
            "primary-button-color": "#5E27DD",
            "accent-color": "#5E27DD",
            "header-bg-color": "#FFFFFF",
            "header-item-bg-hover-color": "#E5E5E5",
            "header-item-font-color": "#000000",
            "header-item-font-hover-color": "#000000",
            "header-border-bottom-color": "#E5E5E5",
            "main-menu-bg-color": "#FFFFFF",
            "main-menu-bg-selected-background": "#5E27DD",
            "main-menu-bg-hover-background": "#E5E5E5",
            "main-menu-font-color": "#000000",
            "main-menu-selected-font-color": "#FFFFFF",
            "main-menu-hover-font-color": "#000000",
            "main-menu-border-color": "#E5E5E5"
          }
        }
      end
    end
  end
end
