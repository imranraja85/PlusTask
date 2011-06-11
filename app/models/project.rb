class Project < ActiveRecord::Base
  has_many :project_user
  has_many :users, :through => :project_user
  has_many :tasks
  has_many :comments, :as => :commentable
  has_many :milestones
  STATUS = ['Requirement Gathering','Design','Coding','Testing','Live']

  def owner
    User.find(owner_id)  
  end

  def number_of_completed_tasks
    tasks.where(:status => 'completed').count  
  end

  def number_of_tasks
    tasks.count  
  end

  def current_milestone
    milestones.where("due_date >= ?",  Date.today).limit(1).first
  end
end
