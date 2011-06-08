class Milestone < ActiveRecord::Base
  belongs_to :project
  belongs_to :user, :foreign_key => :assigned_to
  has_many :tasks

  def assigned_to
    user
  end

  def completed_tasks
    tasks.where(:status => 'completed')  
  end

  def all_tasks
    tasks  
  end
end
