module DashboardHelper
  def percentage_of_tasks_completed_for_a_project(project)
    if project.tasks.count > 0
      content_tag(:span, "#{number_to_percentage((project.tasks_by_status("completed").count.to_f/project.tasks.count.to_f) * 100, :precision => 0)}", :class => 'popping-orange')
    else
      content_tag(:span, "0%", :class => 'popping-orange')
    end
  end

  def tasks_status_for_project(project)
    if project.tasks.count > 0
      "<span class='popping-green'>#{project.tasks_by_status("completed").count}</span><span class='weak-grey'> OF </span> <span class='popping-green'> #{project.tasks.count}</span>".html_safe
    else
      content_tag(:span, "N/A", :class => 'weak-grey')
    end  
  end

  def percentage_of_tasks_completed_for_a_milestone(project, current_project_milestone)
    if current_project_milestone && current_project_milestone.tasks_count > 0
      content_tag(:span, "#{number_to_percentage((current_project_milestone.completed_tasks.count.to_f/current_project_milestone.tasks_count) * 100, :precision => 0)}", :class => 'popping-orange')
    else#if project.current_milestone
      content_tag(:span, "0%", :class => 'popping-orange')
    end
  end

  def tasks_status_for_milestone(project, current_project_milestone)
    if current_project_milestone && current_project_milestone.tasks_count > 0
      "<span class='popping-green'>#{current_project_milestone.completed_tasks.count}</span><span class='weak-grey'> OF </span> <span class='popping-green'> #{current_project_milestone.tasks_count}</span>".html_safe
    else
      content_tag(:span, "N/A", :class => 'weak-grey')
    end  
  end
end
