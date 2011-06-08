class DashboardController < ApplicationController
  layout "manageme"
  def index
    @page_title = "Dashboard Overview"
    @projects = Project.order("updated_at desc")
    #@tasks = Task.order("updated_at desc")
    #@comments = Comment.order("updated_at desc")
  end
end
