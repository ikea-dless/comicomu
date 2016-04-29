set :application, 'comicomu'
set :repo_url, 'git@github.com:kazukousen/comicomu.git'
set :branch, 'master'
set :deploy_to, '/var/www/rails/comicomu'
set :scm, :git
set :log_level, :debug
set :pty, true

set :linked_dirs, %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets)

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
