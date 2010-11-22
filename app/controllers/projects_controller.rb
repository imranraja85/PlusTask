class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(params[:project].merge!(:created_by_id => current_user.id))
    if @project.save
      flash[:notice] = "Successfully added a new project!"
      redirect_to root_url
    else
      flash[:notice] = "failed to create project"
      redirect_to root_url
    end
  end

  def update
  end
end
