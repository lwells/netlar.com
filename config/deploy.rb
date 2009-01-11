
default_run_options[:pty] = true
set :repository,  "git://github.com/lwells/netlar.com.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

set :application, "netlar.com"
set :deploy_to, "/home/lwells/public_html/#{application}"
ssh_options[:port] = 30000
set :user, "lwells"
set :admin_runner, "lwells"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "netlar.com"
role :web, "netlar.com"
role :db,  "netlar.com", :primary => true

namespace :deploy do
	  desc "Restart Application"
	  task :restart, :roles => :app do
	    run "touch #{current_path}/tmp/restart.txt"
	  end
	  desc "Start Application -- not needed for Passenger"
	  task :start, :roles => :app do
	    # nothing -- need to override default cap start task when using Passenger
	  end
	end