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

module OpenProject::Souvap::Patches
  module ColorThemesPatch
    def self.included(base)
      base.singleton_class.prepend InstanceMethods
    end

    module InstanceMethods
      def themes
        super + [souvap_theme]
      end

      def souvap_theme
        {
          theme: 'Souvereign Work Place',
          colors: {
            'primary-color' => "#1A67A3",
            'primary-color-dark' => "#175A8E",
            'alternative-color' => "#35C53F",
            'content-link-color' => "#175A8E",
            'header-bg-color' => "#FAFAFA",
            'header-item-bg-hover-color' => "#175A8E",
            'header-item-font-color' => "#313131",
            'header-item-font-hover-color' => "#313131",
            'header-border-bottom-color' => "#E1E1E1",
            'main-menu-bg-color' => "#ECECEC",
            'main-menu-bg-selected-background' => "#A9A9A9",
            'main-menu-bg-hover-background' => "#FFFFFF",
            'main-menu-font-color' => "#333333",
            'main-menu-hover-font-color' => "#333333",
            'main-menu-selected-font-color' => "#333333",
            'main-menu-border-color' => "#EAEAEA"
          }
        }
      end
    end
  end
end
