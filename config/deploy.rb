# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'tcntd'
set :repo_url, 'git@heroku.com:tcntd.git'
set :rvm_ruby_version, 'ruby-2.1.1@jinji-gemset'
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git
set :deploy_to, '/var/www/tcntd'
set :migration_role, 'app' # Defaults to 'db'
set :deploy_via, :copy

set :scm, :git
set :rails_env, 'production'
set :branch, 'production'
# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true
set :linked_files, %w{config/application.yml config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 10

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute :sudo, "touch tmp/restart.txt"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
        execute :bundle, :exec, :'bin/delayed_job', args, :restart
      # end
    end
  end
end

 namespace :figaro do
   desc "Transfer Figaro's application.yml to shared/config"
   task :upload do
     on roles(:all) do
      execute "mkdir -p #{shared_path}/config"
      upload! "config/application.yml", "#{shared_path}/config/application.yml"
     end
   end
 end
 before "deploy:check", "figaro:upload"
