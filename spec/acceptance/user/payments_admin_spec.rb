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

    page.should have_content "Payments"
    page.should have_content "No payments have been initiated"
  end

  scenario "Payments initiated and paid", js: true do
    sign_in user
    
    page.should have_content "No payments have been initiated"
    bitcoin_address = nil
    
    using_session 'payer' do
      visit root_path
      click_link "Make payment"
      
      fill_in 'Description', with: "Some money for dinner last night"
      fill_in 'Name', with: "Faye Smith"
      fill_in 'Email', with: "faye@smith.com"
      click_button "Finish payment"
      
      bitcoin_address = page.find(".payment .bitcoin_address").text
    end
    
    # Reload page
    click_link "dashboard"
    
    page.should have_no_content "No payments have been initiated" 
    within "#payments" do
      page.should have_content "Some money for dinner last night"
      page.should have_content "Faye Smith"
      page.should have_content "faye@smith.com"

      click_link "details"
      page.should have_content bitcoin_address
    end
  end
  
end