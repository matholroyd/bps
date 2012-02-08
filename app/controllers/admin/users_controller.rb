class Admin::UsersController < Admin::AdminController  
  def edit
    @user = find_user
    @user.full_name = "" if @user.full_name == User::DefaultFullName
  end
  
  def update
    @user = find_user
    if update_attributes(@user)
      redirect_to new_admin_user_check_password_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def update_attributes(user)
    result = user.update_attributes(params[:user])
    if params[:force_set_password] && !user.password.present?
      user.errors.add(:password, "can't be blank") 
      result = false
    end
    result
  end
  
end