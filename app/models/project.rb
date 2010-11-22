class Project < ActiveRecord::Base
  has_many :project_user
  has_many :users, :through => :project_user

  def owner
    User.find(owner_id)  
  end
end
