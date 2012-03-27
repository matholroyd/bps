class DemoController < ApplicationController
  if BPS::Services.demo_mode?
    
    def blank_slate(options = {redirect: true})
      User.destroy_all
      Site.destroy_all
      BitcoinAddress.destroy_all
      Payment.destroy_all
      Transaction.destroy_all
      
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
      setup_site redirect: false unless Site.locked_to_owner?
      
      session[:user_id] = User.first.id
      
      if options[:redirect]
        redirect_to admin_dashboard_path
      end
    end
   
    def add_bitcoin_address(options = {redirect: true})
      sign_in redirect: false
      
      bitcoin = BitcoinAddress.generate
      bitcoin.description = "1x socks\n2x red shirts - medium size"
      bitcoin.save!

      if options[:redirect]
        redirect_to admin_dashboard_path
      end
    end
    
    def add_payment(options = {redirect: true})
      sign_in redirect: false
      
      ba = BitcoinAddress.find_or_create_by_private_key "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1"
      ba.description = "Hardcoded bitcoin address for demo"
      ba.save!
      TransactionImporter.refresh_for [ba]
      
      if options[:redirect]
        redirect_to admin_dashboard_path
      end
    end
    
  end
end