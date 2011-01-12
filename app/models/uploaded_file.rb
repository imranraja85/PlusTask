class UploadedFile < ActiveRecord::Base
  has_attached_file :asset, :styles => {:thumb => "75x75"}
  belongs_to :user
end
