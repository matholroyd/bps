class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  
  protected
  
  def find_user
    User.find(params[:user_id] || params[:id])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def ensure_site_unlocked
    if Site.locked_to_owner?
      flash[:error] = "That action cannot be performed as the site has been locked."
      redirect_to root_path
    end
  end

end
