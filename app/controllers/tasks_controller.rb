class TasksController < ApplicationController
  layout "manageme"

  def new
    @task = Task.new 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @task = Task.new(params[:task])    

    if @task.save
      @project = Project.find(params[:task][:project_id])
      @tasks = @project.tasks.order("created_at desc").group.group_by(&:status)

      respond_to do |format|
        format.js {flash[:notice] = "sucessesfully added task!"}
      end
    end
  end

  #where am i using this?
  def tasks
    @project = Project.find(params[:id])
    @task = @project.tasks.order("created_at desc")
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

  def move_to_completed
    @task = Task.find(params[:id])
    @task.to_completed
    respond_to do |format|
     format.js
    end 
  end
end
