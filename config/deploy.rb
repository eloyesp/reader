## variables ##

set :application, "reader"
set :repository,  "set your repository location here"

set :scm, :git

# Read from local system
set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")
set :rvm_install_type, :stable

set :whenever_command, "bundle exec whenever"

## requires ##

require "rvm/capistrano"
require "bundler/capistrano"
require "whenever/capistrano"

role :web, "your web-server here"                          # Your HTTP server, Apache/etc
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

## tasks ##

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy', 'rvm:install_rvm'

