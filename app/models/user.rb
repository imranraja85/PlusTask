class User < ActiveRecord::Base
  has_many :project_user
  has_many :projects, :through => :project_user
  has_many :uploaded_files

  USER_TYPES = [:ADMIN, :HEADMANAGER, :MANAGER, :EMPLOYEE]
  USER_ACTIONS = ["email","process"]
  DEPARTMENTS = ["IT","Marketing","Finance"]

  scope :by_department, lambda {|department| {:conditions => ["department = ?", department]}}
end
