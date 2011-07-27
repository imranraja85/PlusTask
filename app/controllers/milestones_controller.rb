class MilestonesController < ApplicationController
  layout 'manageme'

  def index
    #TODO: THIS IS WRONG. YOU NEED TO SCOPE OUT THE MILESTONES TIED TO A COMPANY/USER
    @upcoming_milestones = Milestone.where(["due_date < ?", Date.today]).group_by(&:due_date)
    @past_milestones = Milestone.where(["due_date >= ?", Date.today]).group_by(&:due_date)
  end

  def new
    @project = Project.find(params[:project_id])  
    @milestone = Milestone.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @milestone = Milestone.new(params[:milestone].merge(:project_id => params[:project_id], :created_by => current_user))
    if @milestone.save
      @project = Project.find(params[:project_id])
    end
    flash[:notice] = "Milestone sucessfully created"
    render :template => "layouts/lightbox_close", :locals => {:lightbox_message => "Milestone added"}
  end
end
