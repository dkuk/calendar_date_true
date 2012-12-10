require 'redmine'

Redmine::Plugin.register :calendar_date_true do
  name 'Calendar Date True plugin'
  author 'Pitin Vladimir Vladimirovich'
  description 'This plugin forces calendar to insert date into text field in correct format'
  version '0.0.1'
  url 'http://pitin.su'
  author_url 'http://pitin.su'
end

Rails.application.config.to_prepare do
  ApplicationHelper.send(:include, CalendarDateTrue::ApplicationHelperPatch)
end

require 'calendar_date_true/hooks_views'
require 'calendar_date_true/hook_controller_issues_edit_before_save'
