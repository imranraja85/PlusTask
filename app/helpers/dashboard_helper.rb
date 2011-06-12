module DashboardHelper
  def percentage_of_tasks_completed_for_a_project(project)
    if project.current_milestone && project.current_milestone.tasks.count > 0
      content_tag(:span, "#{number_to_percentage((project.current_milestone.completed_tasks.count.to_f/project.current_milestone.tasks.count.to_f) * 100, :precision => 0)}", :class => 'popping-orange')
    else#if project.current_milestone
      content_tag(:span, "0%", :class => 'popping-orange')
    end
  end

  def tasks_status_for_milestone(project)
    if project.current_milestone && project.current_milestone.tasks.count > 0
      "<span class='popping-green'>#{project.current_milestone.completed_tasks.count}</span><span class='weak-grey'> OF </span> <span class='popping-green'> #{project.current_milestone.tasks.count}</span>".html_safe
    else
      content_tag(:span, "N/A", :class => 'weak-grey')
    end  
  end
end
