source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.1', '< 5.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Phusion Passenger as application server
gem 'passenger', require: "phusion_passenger/rack_handler"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use rails-i18n to add locales
gem 'rails-i18n', '~> 5.0.0' # For 5.0.x and 5.1.x
# Use Bootstrap 4 for style - requiring Jquery
gem 'jquery-rails'
gem 'bootstrap', '>= 4.0.0.beta2.1'
# Use activeadmin for administration backend
gem 'activeadmin'
gem 'devise'
gem 'devise-i18n' # for internationalization/localization of devise
# use simple_forms for simplifying form building
gem 'simple_form'
# country_select for simple_form
gem 'country_select'
# cocoon for nested form goodness
gem "cocoon"
# Use Delayed_Job for Active Job asynchronous queue with retries (e.g. mailers)
gem 'delayed_job_active_record'
# Use daemons to keep job runners daemonized
gem "daemons"
# Use sanitize_email to send mails to a specific account in staging
gem 'sanitize_email'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  # use factory_bot as replacement for fixtures
  gem 'factory_bot_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'guard-cucumber', require: false
  gem 'guard-passenger', require:false
end

group :test do
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'launchy'
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
