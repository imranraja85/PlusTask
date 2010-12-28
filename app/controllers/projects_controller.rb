class ProjectsController < ApplicationController
  layout "manageme"

  def index
    @projects = Project.all
  end

  def detailed_view
    @projects = Project.all
    @project = params[:id].present? ? Project.find(params[:id]) : Project.first 
    render :action => "detailed_view", :cat => @project.id
  end

  def show
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
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
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project"
      redirect_to root_url
    else
      flash[:error] = "Failed to update project"
      redirect_to root_url
    end
  end
end
