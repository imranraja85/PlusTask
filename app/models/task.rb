class Task < ActiveRecord::Base
  belongs_to :user, :foreign_key => :assigned_to
  belongs_to :project
  has_many :comments, :as => :commentable

  STATUSES = ["to_do", "in_progress", "completed"]
  #def assigned_to
  #  user.name  
  #end

  def to_in_progress
    update_attribute(:status, "in_progress") 
  end

  def to_completed
    update_attribute(:status, "completed")  
  end
end
