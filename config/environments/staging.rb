Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "con_rails_#{Rails.env}"
  
  ########## Action Mailer Configuration for Production ##########
  config.action_mailer.default_url_options = { host: 'staging.eternal-con.de' } # needed for devise
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => Rails.application.secrets[:smtp][:address],
    :port => 587,
    :domain => Rails.application.secrets[:smtp][:domain],
    :user_name => Rails.application.secrets[:smtp][:username],
    :password => Rails.application.secrets[:smtp][:password],
    :enable_starttls_auto => true,
    :authentication => :login
  }

STAGING_EMAIL = "staging@eternal-con.de"
SanitizeEmail::Config.configure do |config|
  config[:sanitized_to] = STAGING_EMAIL#+.gsub("@", "+to@")
  config[:sanitized_cc] = STAGING_EMAIL#+.gsub("@", "+cc@")
  config[:sanitized_bcc] = STAGING_EMAIL#+.gsub("@", "+bcc@")
  config[:use_actual_email_prepended_to_subject] = true
  config[:use_actual_environment_prepended_to_subject] = true
  config[:use_actual_email_as_sanitized_user_name] = true
  config[:activation_proc] = Proc.new { Rails.env.staging? }
end

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false
  ########## End of Action Mailer Configuration ##################
  
  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  #config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Use the ActionDispatch request id as the unit of work id. This will use just the first chunk of the request id.
  # If you want to use an abbreviated request id for terseness, change the last argument to `true`
  config.middleware.insert_after ActionDispatch::RequestId, Lumberjack::Rack::RequestId, false
  # Use a custom unit of work id to each request
  # config.middleware.insert(0, Lumberjack::Rack::UnitOfWork)
  # Change the logger to use Lumberjack
  log_file_path = Rails.root + "log" + "#{Rails.env}.log"
  config.logger = Lumberjack::Logger.new(log_file_path, :level => :warn, :roll => :daily, :buffer_size => 8192, :flush_seconds => 30 )
  config.logger.formatter.add(Hash, :pretty_print)  # use the Formatter::PrettyPrintFormatter for all Hashes

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
