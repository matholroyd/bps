class DevController < ApplicationController
  if Rails.env.development?
    
    def blank_slate
      User.destroy_all
      Site.destroy_all
      redirect_to root_path
    end
    
    def setup_site
      Site.destroy_all
      site = Site.new name: "Bob's BPS"
      DBC.assert(site.save)
      
      User.destroy_all
      user = User.new( 
        full_name: "Bob Smith", 
        email: "bob@example.com", 
        password: "super secret",
        password_confirmation: "super secret"
      )
      DBC.assert(user.save)
      
      Site.first.lock_to_owner!
      redirect_to root_path
    end
    
  end
end