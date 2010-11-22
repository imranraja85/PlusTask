class ProjectUser < ActiveRecord::Base
  set_table_name "project_user"

  belongs_to :user
  belongs_to :project
end
