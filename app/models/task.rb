class Task < ActiveRecord::Base
  belongs_to :user, :foreign_key => :assigned_to
  belongs_to :project
  belongs_to :milestone
  has_many :comments, :as => :commentable

  #STATUSES = ["to_do", "in_progress", "completed"]
  STATUSES = {:to_do => "To Do",
              :in_progress => "In Progress",
              :completed => "Completed"}

  def to_in_progress
    update_attribute(:status, "in_progress") 
  end

  def to_completed
    update_attribute(:status, "completed")  
  end

  def assigned_to_user
    user.try(:name)
  end
end
