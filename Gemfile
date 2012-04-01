source 'http://rubygems.org'

gem 'rails', '~> 3.2'

gem 'pg'
gem 'jquery-rails'
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'formtastic'
gem 'rails-backbone', git: 'https://github.com/codebrew/backbone-rails.git'

gem 'aasm'

# FFI needed to regenerate public key from private key
gem 'ffi'
gem 'bitcoin-ruby', :git => "https://github.com/mhanne/bitcoin-ruby.git"

gem 'rabl'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'bootstrap-sass'
end

group :development do
  gem 'guard-spork'
end

group :development, :test do
  gem 'ir_b'
  gem 'steak'
  gem 'faker'
  gem 'machinist', :git => 'https://github.com/JamieFlournoy/machinist.git'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'launchy'
end
