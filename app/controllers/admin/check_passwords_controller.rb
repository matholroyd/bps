class Admin::CheckPasswordsController < Admin::AdminController
  def new
    @user = find_user
  end
  
  def create
  end
end