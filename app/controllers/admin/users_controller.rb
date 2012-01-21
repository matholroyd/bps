class Admin::UsersController < Admin::AdminController  
  def edit
    @user = find_user
  end
  
end