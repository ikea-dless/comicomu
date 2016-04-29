# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/rbenv'

# デプロイ先のサーバで、ユーザディレクトリでrbenvをインストールしている場合
set :rbenv_type, :user # :system or :user
set :rbenv_ruby, '2.3.0'

require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

require 'capistrano3/unicorn'

# Rails4から分離したsecrets.ymlの環境変数を .envファイルで管理する
set :linked_files, %w(config/secrets.yml .env)

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
