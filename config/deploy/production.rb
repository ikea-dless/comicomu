set :rails_env, 'production'
set :unicorn_rack_env, 'production'

role :app, %w(guts@52.25.113.156)
role :web, %w(guts@52.25.113.156)
role :db,  %w(guts@52.25.113.156)

server '52.25.113.156', user: 'guts', roles: %w(web app)

set :ssh_options, keys: %w(/Users/music/.ssh/guts_aws_rsa),
                  forward_agent: false,
                  auth_methods: %w(publickey)
