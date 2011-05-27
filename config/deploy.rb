
require "bundler/capistrano"

set :default_stage, "devint"
set :stages, %w{ devint busprev loadtest prod }

require "capistrano/ext/multistage"

set :application, "fbcoupon"
set :repository,  "ssh://git.au.lpint.net/var/git/coupon-rails.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "johnc"
set :deploy_to, "/var/www/html/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :web, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end