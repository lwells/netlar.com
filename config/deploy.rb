# #############################################################
# # Application
# #############################################################
set :application, "netlar.com"
set :deploy_to, "/home/lwells/public_html/#{application}"

# #############################################################
# # Settings going to change this
# #############################################################
 
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, true
set :scm_verbose, true

# #############################################################
# # Servers
# #############################################################
  
set :user, "lwells"
set :user_passphrase, "violet99"
set :domain, "173.45.236.146"
server domain, :app, :web
role :db, domain, :primary => true
set :port, 30000

# #############################################################
# # Git
# #############################################################

set :scm, :git
set :branch, "master"
set :scm_user, "lwells"
set :scm_passphrase, "violet"
set :repository, "git@github.com:lwells/netlar.com.git"
set :deploy_via, :remote_cache

role :app, "netlar.com"
role :web, "netlar.com"
role :db,  "netlar.com", :primary => true