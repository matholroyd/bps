require "#{Rails.root}/spec/support/blueprints"

class DevController < ApplicationController
  if Rails.env.development?
    
    def blank_slate
      User.destroy_all
      Site.destroy_all
      redirect_to root_path
    end
    
    def setup_site
      Site.destroy_all
      Site.make
      User.destroy_all
      User.make
      Site.first.lock_to_owner!
      redirect_to root_path
    end
    
  end
end