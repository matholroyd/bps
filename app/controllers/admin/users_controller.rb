class Admin::UsersController < Admin::AdminController  
  def edit
    @user = find_user
  end
  
  def update
    @user = find_user
    if @user.update_attributes(params[:user])
      redirect_to new_admin_user_check_password_path(@user)
    else
    end
  end
  
end