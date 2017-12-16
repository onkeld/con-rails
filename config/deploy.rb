# config valid only for current version of Capistrano
#lock '3.6.0'
set :repo_url, 'git@github.com:eternalcon/con-rails.git'
set :migration_role, :app
# Default branch is :master
#set :branch, `git rev-parse --abbrev-ref master`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
set :whenever_identifier, ->{ "#{fetch(:application)}" }
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :passenger_rvm_ruby_version, ->{ "#{fetch(:rvm_ruby_version)}" }
set :passenger_restart_with_sudo, true
#set :rvm_ruby_version, '2.3.0'

#after 'deploy:published', 'delayed_job:restart' do
    # restart delayed_job workers
#    invoke 'delayed_job:restart'
    # update crontab when needed
#    invoke 'update_crontab'
#end