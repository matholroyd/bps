class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def ensure_site_unlocked
    if Site.locked_to_owner?
      flash[:error] = "That action cannot be performed as the site has been locked!"
      redirect_to root_path
    end
  end
end
