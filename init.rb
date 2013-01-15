Redmine::Plugin.register :projects_table do
  name 'Projects Table plugin'
  author 'Denis Peplin'
  description 'This plugin adds table view to Projects page'
  version '0.0.4'
  url 'https://github.com/denispeplin/redmine-projects-table'
  author_url 'https://github.com/denispeplin'
end

require 'projects_table'
ProjectsHelper.send(:include, ProjectsTable)
