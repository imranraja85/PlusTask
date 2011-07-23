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

  def tasks_by_status(status)
    tasks.where(:status => status)
  end

  def number_of_tasks
    tasks.count  
  end

  def current_milestone
    milestones.where("due_date >= ?",  Date.today).limit(1).first
  end

  def filter_tasks(filter_params)
    @tasks = tasks

    if filter_params && filter_params[:milestone_id] != "All Milestones"
      @tasks = @tasks.where(:milestone_id => filter_params[:milestone_id])
    end

    if filter_params && filter_params[:person_id] != "All People"
      @tasks = @tasks.where(:assigned_to => filter_params[:person_id])
    end

    @tasks
  end
end
