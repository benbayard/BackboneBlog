require "bundler/capistrano"

set :application, "Backbone Blog"
set :repository,  "https://github.com/benbayard/BackboneBlog"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "Apache"                          # Your HTTP server, Apache/etc
role :app, "Apache"                          # This may be the same as your `Web` server
role :db,  "mysql.benbayard.com", :primary => true # This is where Rails migrations will run
set :asset_env, "#{asset_env} RAILS_RELATIVE_URL_ROOT=/my_sub_uri"


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
set :user, "partyfists"
# you could even do `set :user, application` here
# cap assumes you want to do things with sudo on remote servers, we don't and in fact
# intentionally can't, no problem:
set :use_sudo, false
set :deploy_to "/blog.benbayard.com"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end