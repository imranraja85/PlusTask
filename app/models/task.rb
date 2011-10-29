class Task < ActiveRecord::Base
  belongs_to :user, :foreign_key => :assigned_to
  belongs_to :project
  belongs_to :milestone, :counter_cache => true
  has_many :comments, :as => :commentable

  before_update :update_milestone_tasks_count

  #STATUSES = ["to_do", "in_progress", "completed"]
  STATUSES = {"To Do" => :to_do,
              "In Progress" => :in_progress,
              "Completed" => :completed}


  def due
    try(:milestone).try(:name_and_due_date)
  end

  def to_in_progress
    update_attribute(:status, "in_progress") 
  end

  def to_completed
    update_attribute(:status, "completed")  
  end

  def assigned_to_user
    user.try(:name)
  end

  private
    #update the counters when we move a task to a new milestone
    #TODO: let a task not be assigned a milestone
    #TODO: take into consideration when a move a task to NO MILESTONE or move a task from no milestone to a milestone
    def update_milestone_tasks_count
      if milestone_id_changed?
        Milestone.increment_counter(:tasks_count, milestone_id)
        Milestone.decrement_counter(:tasks_count, milestone_id_was)
      end  
    end
end
