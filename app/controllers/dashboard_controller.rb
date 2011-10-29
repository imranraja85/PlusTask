class DashboardController < ApplicationController
  layout "manageme"
  before_filter :scope_to_company

  def index
    @page_title = "Dashboard"
    @projects = @projects.order("updated_at desc")
  end

  private
    def scope_to_company
      @projects = Project.where(:company_id => current_user.company_id)  
    end
end
