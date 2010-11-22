class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user

  private
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = User.first
    end
end
