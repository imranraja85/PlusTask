class UsersController < ApplicationController
  #layout "manageme"
  layout "lightbox", :except => [:index]

  def index
    @event = Event.new

    if params[:user] && params[:user]["department"] && params[:user]["department"].present?
      @users = User.by_department(params[:user][:department])
    else
      @users = User.all  
    end
   # if params[:send]
   #   UserMailer.welcome_user(User.first,params[:date]).deliver
   # end
    render :layout => 'manageme'
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render :template => 'layouts/lightbox_close', :locals=> {:lightbox_message => "User Updated"}
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
