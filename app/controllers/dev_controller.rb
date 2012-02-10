class DevController < ApplicationController
  if Rails.env.development?
    
    def blank_slate(options = {redirect: true})
      User.destroy_all
      Site.destroy_all
      BitcoinAddress.destroy_all
      
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
    
    def sign_in(options = {redirect: true})
      setup_site redirect: false
      
      session[:user_id] = User.first.id
      
      if options[:redirect]
        redirect_to admin_dashboard_path
      end
    end
   
    def add_bitcoin_address(options = {redirect: true})
      sign_in unless Site.locked_to_owner?
      
      bitcoin = Bitcoin.random_address
      bitcoin.description = "1x socks\n2x red shirts - medium size"
      bitcoin.save!

      if options[:redirect]
        redirect_to admin_dashboard_path
      end
    end
    
    def add_payment
      add_bitcoin_address unless BitcoinAddress.count > 0
      
      
      
    end
  end
end