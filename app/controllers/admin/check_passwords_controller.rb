class Admin::CheckPasswordsController < Admin::AdminController
  def new
    @check_password = CheckPassword.new
  end
  
  def create
   redirect_to setup_successful_admin_site_path
  end
end