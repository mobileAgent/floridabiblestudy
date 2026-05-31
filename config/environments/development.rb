Floridabiblestudy::Application.configure do

  # Settings specified here will take precedence over those in config/environment.rb
  
  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false
  
  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true
  # config.logger = Logger.new(config.log_path, 2, 20.megabytes)
  config.active_support.deprecation = :log

  # Enable the breakpoint server that script/breakpointer connects to
  #config.breakpoint_server = true
  
  # Send Rails logs to STDOUT so `docker compose logs` sees them, and
  # disable Ruby's stdout buffering so they appear immediately rather
  # than only after a buffer fills or the process exits.
  # $stdout.sync = true
  # logger           = ActiveSupport::Logger.new($stdout)
  # logger.formatter = config.log_formatter
  # config.logger    = ActiveSupport::TaggedLogging.new(logger)


  # Show full error reports and disable caching
  # config.action_controller.consider_all_requests_local = true
  config.action_controller.perform_caching             = false
  # config.action_view.debug_rjs                         = true
  
  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :test

  config.eager_load = false

end
