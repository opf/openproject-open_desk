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

module OpenProject::OpenDesk::Patches
  module TopMenuHelperPatch
    def self.included(base)
      base.prepend InstanceMethods
    end

    module InstanceMethods
      def render_top_menu_left
        render_open_desk_logo + super
      end

      def render_module_top_menu_node(*)
        items = first_level_menu_items_for(:open_desk_menu)
        unless items.empty?
          render_menu_dropdown_with_items(
            label: '',
            label_options: { icon: 'icon-menu', title: I18n.t('open_desk.central_navigation_menu') },
            items:,
            options: { drop_down_id: 'more-menu', drop_down_class: 'drop-down--modules ', menu_item_class: 'hidden-for-mobile' }
          )
        end
      end

      def render_open_desk_logo
        content_tag :div, class: 'op-logo opendesk-logo' do
          link_to('', configurable_home_url, title: I18n.t('label_home'), class: 'op-logo--link opendesk-logo--link')
        end
      end

      def render_top_menu_center
        ''
      end
    end
  end
end
