module HelperMethods
  def sign_in(user)
    DBC.require(user)
    DBC.require(Site.locked_to_owner?)
    
    visit root_path
    click_link "admin"

    # Correct details
    fill_in "Email",    with: user.email
    fill_in "Password", with: "super secret"
    click_button "Sign in"

    page.should have_content "Admin dashboard"
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
