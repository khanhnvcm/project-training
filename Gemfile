# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
#
# Core libraries
#
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

#
# Database, ORM, Model, etc
#
gem 'mysql2', '>= 0.4.4'

#
# Web servers
#
gem 'puma', '~> 4.1'

#
# Views
#
gem 'bootstrap', '~> 5.0.0.alpha3'
gem 'kaminari'
gem 'ransack'
gem 'sass-rails', '>= 6'
gem 'select2-rails'
gem 'slim-rails'

#
# Authentication and Authorization
#
gem 'devise'
gem 'pundit'
gem 'rolify'

#
# Others
#
gem 'bootsnap', '>= 1.4.2', require: false
gem 'config'
gem 'jbuilder', '~> 2.7'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'dotenv-rails'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'bullet'
  gem 'hirb'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
