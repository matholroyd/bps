require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature "Get bitcoin address", %q{
  In order to send bitcoins to the owner
  As a guest
  I want the to be able to request a unique bitcoin address
} do

  let!(:owner) { site_setup_and_locked_to_owner }

  scenario "Guest request a bitcoin address so send bitcoins to the owner", js: true do
    visit root_path
    page.should have_content "This site is an online payment service for #{owner.full_name}."
    click_link "Make payment"
    
    page.should have_content "To make a payment to #{owner.full_name}"
    fill_in 'Description', with: "Some money for dinner last night"
    fill_in 'Name', with: "Faye Smith"
    fill_in 'Email', with: "faye@smith.com"
    click_button "Finish payment"

    page.should have_content "send your payment to the following address"
    page.should have_content last_bitcoin_address
  end
  
  def last_bitcoin_address
    Payment.count.should > 0
    Payment.last.bitcoin_address
  end
end
