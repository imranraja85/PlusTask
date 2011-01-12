class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user
  before_filter :authenticate_user!

end
