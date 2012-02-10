require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature "Payments administration", %q{
  In order to understand and react to transactions on my BPS 
  As a User
  I want to be able to view and manage my transactions
} do

  let!(:user) { User.make }
  let!(:site) { Site.make.tap(&:lock_to_owner!) }

  scenario "No payments of any kind", js: true do
    sign_in user
    
    page.should have_content "Transactions"
    page.should have_content "No transactions have been recorded"

    page.should have_content "Bitcoin addresses"
    page.should have_content "No bitcoin addresses have been generated"
  end

  scenario "Payments initiated and paid", js: true do
    sign_in user
    
    page.should have_content "No bitcoin addresses have been generated"
    bitcoin_address = nil
    
    using_session 'payer' do
      visit root_path
      click_link "Make payment"
      
      fill_in 'Description', with: "Some money for dinner last night"
      click_button "Finish payment"
      
      bitcoin_address = page.find(".bitcoin_address").text
    end
    
    # Reload page
    click_link "dashboard"
    
    page.should have_no_content "No bitcoin addresses have been generated" 
    within "#bitcoin_addresses" do
      page.should have_content "Some money for dinner last night"
      page.should have_content bitcoin_address
      
      click_link 'show keys'
      page.should have_content public_key(bitcoin_address)
      page.should have_content private_key(bitcoin_address)
    end
    
    # No money come in yet
    page.should have_content "No transactions have been recorded"
    
    # send_bitcoins to: bitcoin_address, amount: 12.34
    # click_link "dashboard"
    #     
    # within '#transactions' do
    #   page.should have_content "12.34 BTC"
    # end
    
  end
  
end