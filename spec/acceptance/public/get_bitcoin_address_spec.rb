require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature "Get bitcoin address", %q{
  In order to send bitcoins to the owner
  As a Public Guest
  I want the to be able to request a unique bitcoin address
} do

  let!(:owner) { site_setup_and_locked_to_owner }

  scenario "Guest request a bitcoin address so send bitcoins to the owner", js: true do
    visit root_path
    page.should have_content "This site is an online payment service for #{owner.full_name}."
    click_link "Make a payment"

    page.should have_content "Describe your payment"
  
    # Blank description
    fill_in 'Description', with: ""
    click_button "Finish payment"
    page.should have_content "can't be blank"
    
    # Fill out description and other fields
    fill_in 'Description', with: "Some money for dinner last night"
    click_button "Finish payment"

    page.should have_content "send your payment to the following address"
    page.should have_content last_bitcoin_address.address
  end
  
  def last_bitcoin_address
    BitcoinAddress.count.should > 0
    BitcoinAddress.last
  end
end
