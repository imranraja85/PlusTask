class ProjectsController < ApplicationController
  layout "manageme"
  before_filter :load_project, :only => [:show, :update, :people, :tasks, :milestones]
  before_filter :set_project_name, :only => [:show, :milestones, :tasks, :people]

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
    @project = Project.new(params[:project].merge!(:created_by_id => current_user.id, :company_id => current_user.company_id))
    if @project.save
      flash[:notice] = "Successfully added a new project!"
      redirect_to project_path(@project)
    else
      flash[:notice] = "failed to create project"
      redirect_to root_url
    end
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project"
      redirect_to root_url
    else
      flash[:error] = "Failed to update project"
      redirect_to root_url
    end
  end

  def people
    @users = @project.users
    respond_to do |format|
      format.html {render :action => 'show'}
      format.js {render :layout => false}
    end
  end
  
  def tasks
    #if params[:assigned_to]
    #  @tasks = @project.tasks.where(:assigned_to => params[:assigned_to]).order("updated_at desc").group_by(&:status) 
    #else
      #@tasks = @project.tasks.where(:milestone_id => params[:filter][:milestone_id]).order("updated_at desc").group_by(&:status) 
    #end

    @tasks = @project.filter_tasks(params[:filter]).order("updated_at desc").group_by(&:status)

    respond_to do |format|
      format.html {render :action => 'show'}
      format.js 
    end
  end

  def milestones
    if params[:milestone_id]
      @milestone = @project.milestones.where(:id => params[:milestone_id]).first
    else
      @milestone = @project.current_milestone
    end
    respond_to do |format|
      format.html {render :action => 'show'}
      format.js {render :layout => false}
    end
  end

  private
    def load_project
      @project = Project.where(:id => params[:id], :company_id => current_user.company_id).first
    end

    def set_project_name
      @page_title = @project.name  
    end
end
