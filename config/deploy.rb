# Change these
#server '45.55.139.177', port: 22, roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:manjarb/meditation_code.git'
set :application,     'meditation_code'
set :user,            'deploy'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'copy missing css'
  task :copy_missing_css do
    on roles(:app) , in: :sequence, wait: 1 do
      execute "rsync -a #{release_path}/vendor/assets/stylesheets/fontello/ #{release_path}/public/assets/fontello"
      execute "rsync -a #{release_path}/vendor/assets/stylesheets/icon_restaurant/ #{release_path}/public/assets/icon_restaurant"
      execute "cp -a #{release_path}/vendor/assets/stylesheets/skins/square/. #{release_path}/public/assets/"
      execute "cp -a #{release_path}/vendor/assets/images/. #{release_path}/public/assets/images/"

    end
  end

  desc 'clear temp cache'
  task :clear_cache do
    on roles(:app) , in: :sequence, wait: 1 do
      execute "rm -rf #{shared_path}/tmp/cache/[^.]*"

    end
  end

  desc 'generate_sitemap'
  task :generate_sitemap do
    on roles(:app) , in: :sequence, wait: 1 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute "rake","sitemap:refresh:no_ping"
        end
      end
    end
  end

  # desc 'Clear memcache'
  # task :clear_memcache do
  #   on roles(:app) , in: :sequence, wait: 2 do
  #     Rails.cache.clear
  #     CACHE.flush
  #   end
  # end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :copy_missing_css
  after  :finishing,    :clear_cache
  after  :finishing,    :generate_sitemap
  #after  :finishing,    :clear_memcache
  #after  :finishing,    :restart
end



# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma