class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :commentable, :polymorphic => true 
  belongs_to :user
end
