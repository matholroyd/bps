require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "steak"
require 'capybara/dsl'
require 'capybara/rails'

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


Capybara.default_driver = :rack_test
Capybara.javascript_driver = :selenium
Capybara.server_boot_timeout = 50

RSpec.configure do |config|
  config.include Capybara::DSL, type: :acceptance
end
