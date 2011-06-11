class ProjectsController < ApplicationController
  layout "manageme"

  def index
    @projects = Project.all
  end

  def detailed_view
    @projects = Project.all
    @project = params[:id].present? ? Project.find(params[:id]) : Project.first 
    render :action => "detailed_view", :cat => @project.id
    @uploaded_file = UploadedFile.new
  end

  def show
    @project = Project.find(params[:id])
    @page_title = @project.name
    @tasks = @project.tasks.order("id desc")
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end

  def new
    @project = Project.new
    @users = User.all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project].merge!(:created_by_id => current_user.id))
    if @project.save
      flash[:notice] = "Successfully added a new project!"
      redirect_to project_path(@project)
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

  def people
    @project = Project.find(params[:id])
    @users = @project.users
    respond_to do |format|
      format.html {render :action => 'show'}
      format.js {render :layout => false}
    end
  end
  
  def tasks
    @project = Project.find(params[:id])
    @assigned_to_user = params[:assigned_to]
    if params[:assigned_to]
      @tasks = @project.tasks.where(:assigned_to => params[:assigned_to]).order("updated_at desc").group_by(&:status) 
    else
      @tasks = @project.tasks.order("updated_at desc").group_by(&:status) 
    end

    respond_to do |format|
      format.html {render :action => 'show'}
      format.js 
    end
  end

  def milestones
    @project = Project.find(params[:id])
    @milestones = @project.milestones
    respond_to do |format|
      #format.html {render :action => 'milestones'}
      format.html {render :action => 'show'}
      format.js {render :layout => false}
    end
  end
end
