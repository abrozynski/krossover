Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.delivery_method = :smtp



#  YAML.load(File.read('config/local_env.yml')).each {|k, v|  ENV[k.to_s] = v}

  # YAML.load(File.read('config/local_env.yml')).each {|k, v|  ENV[k.to_s] = v}

  
  config.action_mailer.smtp_settings = {
    address: ENV["EMAIL_REFERRAL_SENDER_ADDRESS"],
    port: ENV["EMAIL_REFERRAL_SENDER_PORT"],
    domain: ENV["EMAIL_REFERRAL_SENDER_DOMAIN"],
    authentication: "login",
    enable_starttls_auto: true,
    user_name: ENV["EMAIL_REFERRAL_SENDER_USER_NAME"], 
    password: ENV["EMAIL_REFERRAL_SENDER_PASSWORD"]  
#these authentication needs to be modified 
}
  

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.action_mailer.default_url_options = { host: 'localhost:3000' }

end
