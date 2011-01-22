class TasksController < ApplicationController
  layout "manageme"
  def new
    @task = Task.new 
  end

  def tasks
    @task = Task.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def move_to_in_progress
    @task = Task.find(params[:id])
    @task.to_in_process
    respond_to do |format|
     format.js
    end 
  end
end
