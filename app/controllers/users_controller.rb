class UsersController < ApplicationController 
  before_filter :ensure_site_unlocked
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.set_random_password
    @user.set_default_full_name
    if @user.save
      UserMailer.setup_instructions(@user).deliver
      flash[:success] = "Email with instructions sent"
      redirect_to new_user_path
    else
      flash.now[:error] = "There was a problem with the user"
      render 'new'
    end
  end
  
end