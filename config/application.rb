require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module BPS
  class Application < Rails::Application
    config.autoload_paths += %W(
      #{config.root}/app/presenters
      #{config.root}/app/services
      #{config.root}/lib
    )

    config.assets.enabled = true
    config.assets.version = '1.0'    

    config.encoding = "utf-8"
    config.filter_parameters += [:password]

    config.generators do |g|
      g.test_framework :rspec, views: false
    end

    
    config.action_mailer.default_url_options = {
      host: "localhost",
      port: 3000
    }
  end
end
