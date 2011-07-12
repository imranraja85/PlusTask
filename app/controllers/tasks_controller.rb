class TasksController < ApplicationController
  layout "manageme"
  respond_to :html, :js

  def new
    @task = Task.new 
    @project = Project.find(params[:project_id])
    render :layout => false
    #respond_with(@task, @project)
  end

  def show
    @task = Task.find(params[:id])  
    @comment = Comment.new
  end

  def create
    @task = Task.new(params[:task].merge(:project_id => params[:project_id], :created_by => current_user.id))    

    if @task.save
      @project = Project.find(params[:project_id])
      @tasks = @project.tasks.order("updated_at desc").group.group_by(&:status)

      respond_to do |format|
        format.js {flash[:notice] = "sucessesfully added task!"}
        format.html {render :layout => false, :template => 'layouts/lightbox_close', :locals => {:lightbox_message => "Task successfully added"}}
      end
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    @tasks = @project.tasks.order("updated_at desc").group.group_by(&:status)
  end

  #where am i using this?
 # def tasks
 #   @project = Project.find(params[:id])
 #   @task = @project.tasks.order("created_at desc")
 # end

  def move_to_in_progress
    @task = Task.find(params[:id])
    @task.to_in_progress
    @project = Project.find(@task.project_id)
    @tasks = @project.tasks.order("updated_at desc").group.group_by(&:status)
  end

  def move_to_completed
    @task = Task.find(params[:id])
    @task.to_completed
    @project = Project.find(@task.project_id)
    @tasks = @project.tasks.order("updated_at desc").group.group_by(&:status)
  end
end
