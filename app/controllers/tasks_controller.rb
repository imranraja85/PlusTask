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
end
