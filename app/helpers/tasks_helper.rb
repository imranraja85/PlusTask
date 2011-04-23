module TasksHelper
  def display_link_based_on_task_status(task)
    case task.status
    when "to_do"
      link_to("Start Task", move_to_in_progress_task_path(task), :remote => true, :id => task.id)
    when "in_progress"
      link_to("Complete Task", move_to_completed_task_path(task), :remote => true, :id => task.id)
    when "completed"
    end
  end

  #compare a task's updated_at field to the task before it to check whether its been
  #updated on the same day
  def display_date_divider(current_task, tasks, index)
    "<div class='task-date-divider'>#{fmt_month_day_year(current_task.updated_at)}</div>" if current_task.updated_at.to_date != tasks[index-1].updated_at.to_date
  end
end
