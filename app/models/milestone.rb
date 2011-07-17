class Milestone < ActiveRecord::Base
  belongs_to :project
  belongs_to :user, :foreign_key => :assigned_to
  has_many :tasks

  def assigned_to
    user
  end

  def name_and_due_date
    "#{name} - #{due_date.strftime("%m/%d/%Y")}"  
  end

  def completed_tasks
    tasks.where(:status => 'completed')  
  end

  def tasks_by_status(status)
    tasks.where(:status => status)  
  end

  def all_tasks
    tasks  
  end
end
