class DashboardController < ApplicationController
  layout "manageme"
  def index
    @projects = Project.all
  end
end
