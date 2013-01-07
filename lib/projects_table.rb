module ProjectsTable
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :render_project_hierarchy, :projects_table
    end
  end

  module InstanceMethods
    def render_project_hierarchy_with_projects_table(projects)
      render_project_nested_lists(projects) do |project|
        link_to_project(project, {}, :class => "#{project.css_classes} #{User.current.member_of?(project) ? 'my-project' : nil}")
      end
    end
  end
end
