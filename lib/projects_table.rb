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
        s = link_to_project(project, {}, :class => "#{project.css_classes} #{User.current.member_of?(project) ? 'my-project' : nil}")
        if project.description.present?
          s << content_tag('div', textilizable(project.short_description, :project => project), :class => 'wiki description')
        end
        s
      end
    end
  end
end
