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