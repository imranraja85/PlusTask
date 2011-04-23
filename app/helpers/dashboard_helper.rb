module DashboardHelper
  def percentage_of_tasks_completed_for_a_project(project)
    if project.number_of_tasks > 0
      number_to_percentage((project.number_of_completed_tasks.to_f/project.number_of_tasks.to_f) * 100, :precision => 2)
    else
      "No Tasks"
    end
  end
end
