require 'capistrano/ext/multistage'

set :application, "simple_web_app"
set :stages, ["vagrant"]
set :default_stage, 'vagrant'
set :use_sudo, false
set :keep_releases, 5
set :deploy_via, :remote_cache
default_run_options[:pty] = true
default_run_options[:shell] = '/bin/bash --login'

before 'deploy:restart', 'gems:bundle'

namespace :gems do
  task :bundle, :roles => :app do
    run "cd #{current_path} && BUNDLE_GEMFILE=Gemfile bundle install"
  end
end

namespace :deploy do

  desc "initial setup for the database"
  task :db_setup do
    run "cd #{current_path}; bundle exec rake db:setup RAILS_ENV=#{rails_env}"
  end

  desc "Zero-downtime restart of Unicorn"
  task :restart, :except => { :no_release => true } do
    run "kill -s USR2 `cat /tmp/unicorn.simple_web_app.pid`"
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
    run "kill -s QUIT `cat /tmp/unicorn.simple_web_app.pid`"
  end
end