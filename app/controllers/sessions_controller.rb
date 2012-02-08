class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new params[:session]
    if @session.valid?
      session[:user_id] = @session.user.id
      redirect_to admin_dashboard_path, :notice => "Logged in!"
    else
      flash.now.alert = "Sign in details are incorrect"
      render "new"
    end
  end

  def owner_setup_site
    if Site.unlocked?
      session[:user_id] = User.first.id
      redirect_to new_admin_site_path
    else
      flash[:error] = "The site has been locked!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end