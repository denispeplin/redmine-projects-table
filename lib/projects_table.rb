module ProjectsTable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :render_project_hierarchy, :projects_table
    end
  end

  module InstanceMethods
    def render_project_hierarchy_with_projects_table(projects)
      render('table', :projects => projects.sort_by(&:lft))
    end
  end
end
