class Task < ActiveRecord::Base
  belongs_to :user, :foreign_key => :assigned_to
  belongs_to :project

  def assigned_to
    user.name  
  end

  def to_in_process
    update_attribute(:status, "In Process") 
  end

  def to_completed
    update_attribute(:status, "Completed")  
  end
end
