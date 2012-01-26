module SiteStateHelpers
  def site_not_locked
    using_session 'other person' do
      visit root_path
      page.should have_content "site has not been locked"
      
      visit new_user_path
      page.should have_button("Send setup instructions")

      visit owner_setup_site_path
      page.should have_content("Site name")
      page.should have_button("Continue")
    end
  end
  
  def site_locked
    using_session 'other person' do
      visit root_path
      page.should have_no_content "site has not been locked"

      visit new_user_path
      page.should have_no_button("Send setup instructions")

      visit owner_setup_site_path
      page.should have_no_content("Site name")
      page.should have_no_button("Continue")
    end
  end

  def site_setup_and_locked_to_owner
    site = Site.make
    owner = User.make
    site.lock_to_owner!
    owner
  end

end

RSpec.configuration.include SiteStateHelpers
