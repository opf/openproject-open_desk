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
  module TopMenuHelperPatch
    def self.included(base)
      base.prepend InstanceMethods
    end

    module InstanceMethods
      def render_top_menu_left
        render_souvap_logo + super
      end

      def top_menu_left_menu_items
        [render_module_top_menu_node]
      end

      def render_souvap_logo
        content_tag :div, class: 'op-logo souvap-logo' do
          link_to('', configurable_home_url, title: I18n.t('label_home'), class: 'op-logo--link souvap-logo--link')
        end
      end

      def render_top_menu_center
        ''
      end

      def render_top_menu_right
        top_menu_right_node
      end

      def top_menu_right_menu_items
        [
          render_projects_top_menu_node,
          render_quick_add_menu,
          render(partial: 'search/mini_form'),
          render_main_top_menu_nodes,
          render_notification_top_menu_node,
          render_help_top_menu_node,
          render_user_top_menu_node
        ]
      end
    end
  end
end
