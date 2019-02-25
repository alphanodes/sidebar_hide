class SidebarHookListener < Redmine::Hook::ViewListener
  render_on :view_layouts_base_content, partial: 'sidebar/hide_button'

  def view_layouts_base_html_head(context = {})
    if Redmine::Plugin.installed?('redmine_agile')
      info = Rails.application.routes.recognize_path(context[:request].url)
      return if info.present? && (info[:controller] == 'agile_charts' && info[:action] == 'show' ||
                                info[:controller] == 'versions' && info[:action] == 'show')
    end

    stylesheet_link_tag('sidebar_hide', plugin: 'sidebar_hide', media: 'all') +
      javascript_include_tag('sidebar_hide', plugin: 'sidebar_hide')
  end
end
