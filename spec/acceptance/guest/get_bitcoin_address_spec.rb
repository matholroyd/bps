require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature "Get bitcoin address", %q{
  In order to send bitcoins to the owner
  As a guest
  I want the to be able to request a unique bitcoin address
} do

  let!(:owner) { site_setup_and_locked_to_owner }

  scenario "Guest request a bitcoin address so send bitcoins to the owner" do
    visit root_path
    
    page.should have_content "This site is an online payment service for #{owner.full_name}."
    
  end
end
