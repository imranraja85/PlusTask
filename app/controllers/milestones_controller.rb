class MilestonesController < ApplicationController
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
