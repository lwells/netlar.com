set :application, "netlar.com"
set :user, "lwells"
set :repository, "git@github.com:lwells/netlar.com.git"
set :git, "/usr/local/libexec/git-core"
set :scm_command, "git" 
set :scm, "git"
set :port, 30000
set :deploy_to, "/home/lwells/public_html/#{application}"


role :app, "netlar.com"
role :web, "netlar.com"
role :db,  "netlar.com", :primary => true