class UsersController < ApplicationController

  def index
    @users = User.all  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Employee successfully added"
      redirect_to root_url
    else
      flash[:notice] = "Failed to add employee"
      redirect_to root_url
    end
  end
end
