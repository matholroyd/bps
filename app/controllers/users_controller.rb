class UsersController < ApplicationController 
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.set_random_password
    if @user.save
      flash[:success] = "Email with instructions sent"
      redirect_to root_path
    else
      flash.now[:error] = "There was a problem with the user"
      render 'new'
    end
  end
end