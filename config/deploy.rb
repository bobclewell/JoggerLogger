require "bundler/capistrano"

default_run_options[:pty] = true

set :application, 'joggerlogger'
set :repository,  'git@github.com:bobclewell/JoggerLogger.git'
set :branch, 'master'
set :deploy_to, '/var/www/joggerlogger.net'

set :scm, 'git'
set :scm_username, 'bobclewell'

set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true

set :user, 'bob'  # The server's user for deploys
# set :scm_passphrase, 'run like the wind jose'  # The deploy user's password

role :web, 'abe'                          # Your HTTP server, Apache/etc
role :app, 'abe'                          # This may be the same as your `Web` server
role :db,  'abe', :primary => true # This is where Rails migrations will run
role :db,  'abe'

# after "deploy:update_code", "bundle:install"
 
# namespace :bundle do
#   desc "Bundle install"
#   task :install, :roles => :app do
#     run "cd #{current_release} && #{sudo} bundle install"
#   end
# end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"