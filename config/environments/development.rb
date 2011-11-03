Manageme::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
#  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address        =>  "smtp.gmail.com",
    :port           => 587,
    :domain         => "imranraja.com",
    :user_name      => 'iraja1215test@gmail.com',
    :password       => 'testpass1',
    :authentication => 'plain',
    :enable_starttls_auto => true 
   }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log
  Mysql2::Client.default_query_options[:connect_flags] |= Mysql2::Client::LOCAL_FILES

  # Do not compress assets
  config.assets.compress = true
  config.assets.precompile += ['homepage.css']

  #Expands the lines which load the assets
  config.assets.debug = true
end
