module HelperMethods
  def sign_in(user)
    DBC.require(user)
    DBC.require(Site.locked_to_owner?)
    
    visit root_path
    click_link "Admin"

    # Correct details
    fill_in "Email",    with: user.email
    fill_in "Password", with: "super secret"
    click_button "Sign in"

    page.should have_content "Dashboard"
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
