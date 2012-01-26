class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def owner_setup_site
    if Site.unlocked?
      session[:user_id] = User.first.id
      redirect_to new_admin_site_path
    else
      flash[:alert] = "The site has been locked!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end