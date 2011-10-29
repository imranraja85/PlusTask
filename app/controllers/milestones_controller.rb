class MilestonesController < ApplicationController
  layout 'manageme', :except => [:new]

  def index
    @upcoming_milestones = Milestone.select("due_date").where(["company_id = ? and due_date >= ?", session[:company_id], Date.today]).group("due_date")
    @past_milestones     = Milestone.select("due_date").where(["company_id = ? AND due_date < ?", session[:company_id], Date.today]).group("due_date")
    @milestones = []
  end

  # AJAX
  # Given a date, loads all milestones associated with that date
  def milestones_by_date
    @due_date = Date.parse(params[:due_date])
    @milestones = Milestone.where(["company_id = ? and DATE(due_date) = ?", session[:company_id], params[:due_date]])
    respond_to do |format|
      format.js
    end
  end

  def new
    @project = Project.find(params[:project_id])  
    @milestone = Milestone.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @milestone = Milestone.new(params[:milestone].merge(:company_id => current_user.company_id, :project_id => params[:project_id], :created_by => current_user))
    if @milestone.save
      @project = Project.find(params[:project_id])
    end
    flash[:notice] = "Milestone sucessfully created"
    render :template => "layouts/lightbox_close", :locals => {:lightbox_message => "Milestone added"}
  end
end
