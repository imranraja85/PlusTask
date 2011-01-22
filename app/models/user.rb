class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :project_user
  has_many :projects, :through => :project_user
  has_many :uploaded_files
  has_many :tasks, :foreign_key => :assigned_to

  USER_TYPES = [:ADMIN, :HEADMANAGER, :MANAGER, :EMPLOYEE]
  USER_ACTIONS = ["email","process"]
  DEPARTMENTS = ["IT","Marketing","Finance"]

  scope :by_department, lambda {|department| {:conditions => ["department = ?", department]}}
end
