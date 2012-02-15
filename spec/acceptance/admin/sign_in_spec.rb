require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature "Sign in", %q{
  In order to manage my BPS 
  As an Admin User
  I want to be able to sign in
} do

  let!(:user) { User.make }
  let!(:site) { Site.make.tap(&:lock_to_owner!) }

  scenario "Signing in gives access to admin", js: true do
    visit root_path
    
    click_link "admin"
    
    page.should have_content "Admin sign in"
    
    # Fill out nothing
    click_button "Sign in"
    page.within "#session_email_input" do
      page.should have_content "can't be blank"
    end

    # Wrong email
    fill_in "Email",    with: "non-existant-email@example.com"
    fill_in "Password", with: "super secret"
    click_button "Sign in"
    page.should have_content "Sign in details are incorrect"

    # Wrong password
    fill_in "Email",    with: user.email
    fill_in "Password", with: "wrong password"
    click_button "Sign in"
    page.should have_content "Sign in details are incorrect"

    # Correct details
    fill_in "Email",    with: user.email
    fill_in "Password", with: "super secret"
    click_button "Sign in"

    page.should have_content "Admin dashboard"
  end
  
end