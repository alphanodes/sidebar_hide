# frozen_string_literal: true

loader = RedminePluginKit::Loader.new plugin_id: 'redmine_ref_issues'

Redmine::Plugin.register :sidebar_hide do
  name 'Sidebar Hide Plugin'
  author 'Berk Demirkır, AlphaNodes'
  url 'https://github.com/alphanodes/sidebar_hide'
  description 'This plugin provides ability to hide sidebar'
  version SidebarHide::VERSION
end

RedminePluginKit::Loader.persisting { loader.load_model_hooks! }
RedminePluginKit::Loader.to_prepare { SidebarHide.setup! } if Rails.version < '6.0'
