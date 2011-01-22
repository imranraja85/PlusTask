class Task < ActiveRecord::Base
  belongs_to :user, :foreign_key => :assigned_to
  belongs_to :project

  def to_in_process
    update_attribute(:status, "In Process") 
  end
end
