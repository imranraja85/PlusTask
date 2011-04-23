class HomeController < ApplicationController
  layout 'application'
  skip_before_filter :authenticate_user!

  def index 
  end
end
