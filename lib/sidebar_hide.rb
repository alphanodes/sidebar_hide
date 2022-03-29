# frozen_string_literal: true

module SidebarHide
  VERSION = '0.0.10'

  include RedminePluginKit::PluginBase

  class << self
    private

    def setup
      # Load view macros
      loader.load_view_hooks!
    end
  end
end
