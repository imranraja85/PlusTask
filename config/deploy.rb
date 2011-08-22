set :application, "plustask"
set :repository, "git@github.com:imranraja85/PlusTask.git"
default_run_options[:pty] = true
#ssh_options[:forward_agent] = true

set :scm, :git
set :user, "ptask"
#set scm_passphrase, 'password'
set :branch, "master"
set :deploy_to, "/home/ptask/public_html/#{application}"

#remote caching will keep a local git repo on the server you're deploying
#to and simpliy run a fetch rather than an entire clone
set :deploy_via, :copy

role :web, "50.57.46.248"                   # Your HTTP server, Apache/etc
role :app, "50.57.46.248"                   # This may be the same as your `Web` server
role :db,  "50.57.46.248", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
