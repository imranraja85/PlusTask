class CommentsController < ApplicationController
  respond_to :html, :js

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment].merge(:user_id => current_user.id, :commentable_type => 'Task', :commentable_id => params[:task_id]))
  
    if @comment.save
      @task = Task.find(params[:task_id])
      respond_to do |format|
        format.js {flash[:notice] = "Successfully added a comment!"}
      end 
    end
  end

end
