# frozen_string_literal: true

require_dependency 'sidebar_hook_listener'

Redmine::Plugin.register :sidebar_hide do
  name 'Sidebar Hide Plugin'
  author 'Berk Demirkır, AlphaNodes'
  url 'https://github.com/alphanodes/sidebar_hide'
  description 'This plugin provides ability to hide sidebar'
  version '0.0.9'
end
