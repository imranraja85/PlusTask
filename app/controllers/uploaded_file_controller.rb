class UploadedFileController < ApplicationController
  def create
    @uploaded_file = UploadedFile.create(params[:uploaded_file].merge(:user_id => current_user.id))
    redirect_to :back
  end
end
