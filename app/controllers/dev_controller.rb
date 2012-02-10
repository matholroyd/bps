class DevController < ApplicationController
  if Rails.env.development?
    
    def blank_slate(options = {redirect: true})
      User.destroy_all
      Site.destroy_all
      Payment.destroy_all
      
      if options[:redirect]
        redirect_to root_path
      end
    end
    
    def setup_site(options = {redirect: true})
      blank_slate redirect: false

      site = Site.new name: "Bob's BPS"
      DBC.assert(site.save)

      user = User.new( 
        full_name: "Bob Smith", 
        email: "bob@example.com", 
        password: "super secret",
        password_confirmation: "super secret"
      )
      DBC.assert(user.save)
      
      Site.first.lock_to_owner!
      
      if options[:redirect]
        redirect_to root_path
      end
    end
    
    def sign_in
      setup_site redirect: false
      
      session[:user_id] = User.first.id
      redirect_to admin_dashboard_path
    end
    
    def add_payment
      Payment.create!(
        description: "1x socks\n2x red shirts - medium size", 
        bitcoin_address: Bitcoin.random_address,
        payer: "Bob Smith",
        email: "bob@example.com"
      ) 
      redirect_to admin_dashboard_path
    end
    
  end
end