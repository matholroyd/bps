require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature "Sign in", %q{
  In order to be able to use my bitcoins 
  As an Admin User
  I want to be send by bitcoins to an external address
} do

  let!(:user) { User.make }
  let!(:site) { Site.make.tap(&:lock_to_owner!) }

  let(:ba_several_transactions) { 
    BitcoinAddress.make private_key: "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1",
    description: "demo address with 2 transactions" 
  }

  scenario "send bitcoins", js: true do
    Wallet.send_bitcoins(to: BitcoinAddress.generate.address, amount: 0.1)
  end
  
end