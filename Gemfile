source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '4.2.6'
gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bootstrap-sass'
gem 'honoka-rails', '>= 3.3.6.3'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'omniauth-twitter'
gem 'dotenv-rails'
gem 'awesome_print', require: 'ap'
gem 'pry-rails'

# gem 'bcrypt', '~> 3.1.7'

group :test do
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'minitest'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '2.5.0'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'rubocop', require: false
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'guard-rspec', require: false
  gem 'guard-spring'
  gem 'guard-rubocop'
end

group :production do
  gem 'unicorn'
  gem 'therubyracer', platforms: :ruby
end
