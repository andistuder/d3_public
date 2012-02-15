D3::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  config.log_level = :debug

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  #HttpLog.options[:severity] = Logger::Severity::INFO
  #HttpLog.options[:log_connect] = false
  #HttpLog.options[:log_request] = false
  #HttpLog.options[:log_data] = false
  #HttpLog.options[:log_status] = false
  #HttpLog.options[:log_response] = false
  #HttpLog.options[:log_benchmark] = false
end

