# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'devise'
gem 'ipaddr'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'rails', '~> 6.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# html, css and js
gem 'autoprefixer-rails'
gem 'bootstrap', '~> 4.0'
gem 'bootstrap_form'
gem 'bootstrap-multiselect-rails'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails', '~> 4.7.0'
gem 'gon'
gem 'haml-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'rack-attack'
gem 'sass-rails'
gem 'sprockets-rails', '2.3.3'
gem 'tilt'
gem 'turbolinks'
gem 'will_paginate', require: %w[will_paginate will_paginate/array]
gem 'will_paginate-bootstrap4'
gem 'webpacker'

# other
gem 'email_validator', '~> 1.6'
gem 'httparty'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development do
  gem 'guard'
  gem 'guard-rspec'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'listen', '~> 3.1'
  gem 'overcommit'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'capybara-chromedriver-logger'
  gem 'capybara-selenium'
  gem 'database_cleaner', '~> 1.5'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'valid_attribute', '~> 2.0'
  gem 'webdrivers'
  gem 'webmock', '~> 3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
