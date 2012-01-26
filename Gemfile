source 'http://rubygems.org'

gem 'rails', '~> 3.2'

gem 'pg'
gem 'jquery-rails'
gem 'bcrypt-ruby', require: 'bcrypt'
gem 'formtastic'

# Gem spec hasn't been updated, so to supress ruby 1.9 warnings, just reference 
# andand master branch directly
gem "andand",       :git => "https://github.com/raganwald/andand.git" 
gem "aasm"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
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
