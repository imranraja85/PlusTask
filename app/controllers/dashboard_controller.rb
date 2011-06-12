class DashboardController < ApplicationController
  layout "manageme"
  def index
    @page_title = "Dashboard Overview"
    @projects = Project.order("updated_at desc").includes(:milestones, :tasks)
  end
end
