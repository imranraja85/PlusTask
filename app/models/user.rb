class User < ActiveRecord::Base
  has_many :project_user
  has_many :projects, :through => :project_user

  USER_TYPES = [:ADMIN, :HEADMANAGER, :MANAGER, :EMPLOYEE]
end
