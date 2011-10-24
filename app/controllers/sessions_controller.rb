class SessionsController < Devise::SessionsController
  def create
    session[:user_id] = current_user.id
    session[:user_name] = current_user.name
    session[:company_id] = current_user.company_id
    session[:company_name] = current_user.try(:company).try(:name)
    super
  end

  def render(*args)
    options = args.extract_options!
    options[:template] = "/devise/sessions/#{params[:action]}"
    super(*(args << options))
  end
  
end
