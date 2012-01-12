require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Blank Slate", %q{
  In order to allow anyone to setup a BPS for any other person 
  As the owner
  I want the to be led through the setup process and have the site locked to me
} do

  scenario "Visiting blank site then setting up" do
    visit "/"
    
    page.should have_content "Bitcoin Payment Service"
    page.should have_content "This site has not been locked to an owner"

    # No email
    click_button "Send setup instructions"
    page.within "#user_email_input" do
      page.should have_content "can't be blank"
    end
    
    # Not an email
    fill_in "Email", with: "not an email"
    click_button "Send setup instructions"
    page.within "#user_email_input" do
      page.should have_content "is not valid"
    end
    
    # Proper email 
    fill_in "Email", with: "owen@example.com"
    click_button "Send setup instructions"
    page.should have_content "Email with instructions sent"
  end
  
end
