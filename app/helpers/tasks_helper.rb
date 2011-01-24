module TasksHelper
  def display_link_based_on_task_status(task)
    case task.status
    when "To Do"
      link_to("Start Task", move_to_in_progress_task_path(task), :remote => true, :id => task.id)
    when "In Process"
      link_to("Complete Task", move_to_completed_task_path(task), :remote => true, :id => task.id)
    when "Completed"
    end
  end
end
