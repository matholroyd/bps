class Admin::CheckPasswordsController < Admin::AdminController
  def new
    @check_password = CheckPassword.new
  end
  
  def create
    @check_password = CheckPassword.new params[:check_password].merge(user: find_user)
    if @check_password.save
      redirect_to setup_successful_admin_site_path
    else
      render :new
    end
  end
end