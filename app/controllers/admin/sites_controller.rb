class Admin::SitesController < Admin::AdminController
  
  def new
    @site = Site.new
  end
  
  def create 
    @site = Site.new params[:site]
    if @site.save
      redirect_to edit_admin_user_path(current_user)
    else
      render :new
    end
  end
  
  def setup_successful
  end
  
end