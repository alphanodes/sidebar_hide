# frozen_string_literal: true

# This file is a part of redmine_wiki_guide
#
# Copyright (c) 2021-2022 AlphaNodes GmbH
# https://alphanodes.com

module SidebarHide
  module Hooks
    class ViewHook < Redmine::Hook::ViewListener
      render_on :view_layouts_base_content, partial: 'sidebar/hide_button'

      def view_layouts_base_html_head(context = {})
        if Redmine::Plugin.installed? 'redmine_agile'
          begin
            info = Rails.application.routes.recognize_path context[:request].url
            return if info.present? && (info[:controller] == 'agile_charts' && info[:action] == 'show' ||
                                      info[:controller] == 'versions' && info[:action] == 'show')
          rescue StandardError => e
            Rails.logger.warn e.message unless e.is_a? ActionController::RoutingError
          end
        end

        stylesheet_link_tag('sidebar_hide', plugin: 'sidebar_hide', media: 'all') +
          javascript_include_tag('sidebar_hide', plugin: 'sidebar_hide')
      end
    end
  end
end
