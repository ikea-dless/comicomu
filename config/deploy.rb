# config valid only for Capistrano 3.1
lock '3.4.1'

set :application, 'comicomu'
set :repo_url, 'git@github.com:kazukousen/comicomu.git'
set :branch, 'master'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/rails/comicomu'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets)

# Default value for default_env is {}
set :default_env, path: '/home/guts/.rbenv/shims:/home/guts/.rbenv/bin:$PATH'

# Default value for keep_releases is 5
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  # 上記linked_filesで使用するファイルをアップロードするタスク
  #  deployが行われる前に実行する必要がある。
  desc 'upload importabt files'
  task :upload do
    on roles(:app) do
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
      upload!('.env', "#{shared_path}/.env")
    end
  end
end
