source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'redis'
gem 'rails-i18n'
gem 'seed-fu'
gem 'dotenv-rails'
gem 'sidekiq'
gem 'faker'
gem 'pundit'
gem 'activerecord-import'
gem 'rails_same_site_cookie'
gem 'rack-cors'
gem 'graphql'
gem 'sass-rails'
gem 'googleauth'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'bullet'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-erd'
  gem 'graphiql-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
