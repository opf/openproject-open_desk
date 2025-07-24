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
      def render_module_top_menu_node(*)
        return unless User.current.logged?
        items = first_level_menu_items_for(:open_desk_menu)
        unless items.empty?
          # Load entries here so partial can render
          @entries = find_navigational_items

          render Primer::Alpha::Dialog.new(classes: "op-app-menu--item",
                                           title: I18n.t("open_desk.central_navigation_menu"),
                                           size: :small,
                                           menu_id: "op-app-header--modules-menu",
                                           position: :left) do |dialog|
            dialog.with_show_button(icon: "op-grid-menu",
                                    scheme: :invisible,
                                    classes: "op-app-menu--item-action op-app-header--primer-button",
                                    title: I18n.t("open_desk.central_navigation_menu"),
                                    test_selector: "op-app-header--modules-menu-button",
                                    "aria-controls": "op-app-header--modules-menu-list",
                                    "aria-label": I18n.t("open_desk.central_navigation_menu"))

            dialog.with_body do
               render partial: "open_desk/central_navigation/menu_entries"
            end
          end
        end
      end

      private

      def find_navigational_items
        adapter_cls = ::OpenProject::OpenDesk::CentralNavigationAdapters.find_applicable
        return [] unless adapter_cls

        adapter_cls
          .new(user: current_user, session: request.session)
          .fetch_entries
      end
    end
  end
end
