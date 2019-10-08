module ProjectsTable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method :render_project_hierarchy_without_projects_table, :render_project_hierarchy
      alias_method :render_project_hierarchy, :render_project_hierarchy_with_projects_table
    end
  end

  module InstanceMethods
    def render_project_hierarchy_with_projects_table(projects)
      render('table', :projects => projects.sort_by(&:lft))
    end
  end
end
